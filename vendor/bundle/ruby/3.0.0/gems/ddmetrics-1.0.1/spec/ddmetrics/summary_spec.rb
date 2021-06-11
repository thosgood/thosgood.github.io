# frozen_string_literal: true

describe DDMetrics::Summary do
  subject(:summary) { described_class.new }

  describe '#observe' do
    context 'non-hash label' do
      subject { summary.observe(1.23, 'WRONG UGH') }

      it 'errors' do
        expect { subject }.to raise_error(ArgumentError, 'label argument must be a hash')
      end
    end
  end

  describe '#get' do
    subject { summary.get(filter: :erb) }

    before do
      summary.observe(2.1, filter: :erb)
      summary.observe(4.1, filter: :erb)
      summary.observe(5.3, filter: :haml)
    end

    it { is_expected.to be_a(DDMetrics::Stats) }

    its(:sum) { is_expected.to eq(2.1 + 4.1) }
    its(:count) { is_expected.to eq(2) }
  end

  describe '#labels' do
    subject { summary.labels }

    before do
      summary.observe(2.1, filter: :erb)
      summary.observe(4.1, filter: :erb)
      summary.observe(5.3, filter: :haml)
    end

    it { is_expected.to match_array([{ filter: :haml }, { filter: :erb }]) }
  end

  describe '#each' do
    subject do
      {}.tap do |res|
        summary.each { |label, stats| res[label] = stats.avg.round(2) }
      end
    end

    before do
      summary.observe(2.1, filter: :erb)
      summary.observe(4.1, filter: :erb)
      summary.observe(5.3, filter: :haml)
    end

    it { is_expected.to eq({ filter: :haml } => 5.3, { filter: :erb } => 3.1) }

    it 'is enumerable' do
      expect(summary.map { |_label, stats| stats.sum }.sort)
        .to eq([5.3, 2.1 + 4.1])
    end
  end

  describe '#to_s' do
    subject { summary.to_s }

    context 'one label' do
      before do
        summary.observe(2.1, filter: :erb)
        summary.observe(4.1, filter: :erb)
        summary.observe(5.3, filter: :haml)
      end

      it 'returns table' do
        expected = <<~TABLE
          filter │ count    min    .50    .90    .95    max    tot
          ───────┼────────────────────────────────────────────────
             erb │     2   2.10   3.10   3.90   4.00   4.10   6.20
            haml │     1   5.30   5.30   5.30   5.30   5.30   5.30
        TABLE

        expect(subject.strip).to eq(expected.strip)
      end
    end

    context 'multiple labels' do
      before do
        summary.observe(2.1, filter: :erb, stage: :pre)
        summary.observe(4.1, filter: :erb, stage: :pre)
        summary.observe(1.2, filter: :erb, stage: :post)
        summary.observe(5.3, filter: :haml, stage: :post)
      end

      it 'returns table' do
        expected = <<~TABLE
          filter   stage │ count    min    .50    .90    .95    max    tot
          ───────────────┼────────────────────────────────────────────────
             erb     pre │     2   2.10   3.10   3.90   4.00   4.10   6.20
             erb    post │     1   1.20   1.20   1.20   1.20   1.20   1.20
            haml    post │     1   5.30   5.30   5.30   5.30   5.30   5.30
        TABLE

        expect(subject.strip).to eq(expected.strip)
      end
    end
  end
end
