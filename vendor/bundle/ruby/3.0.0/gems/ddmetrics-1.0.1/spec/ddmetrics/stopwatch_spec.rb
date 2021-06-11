# frozen_string_literal: true

describe DDMetrics::Stopwatch do
  subject(:stopwatch) { described_class.new }

  after { Timecop.return }

  it 'is zero by default' do
    expect(stopwatch.duration).to eq(0.0)
  end

  it 'records correct duration after start+stop' do
    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 0))
    stopwatch.start

    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 1))
    stopwatch.stop

    expect(stopwatch.duration).to eq(1.0)
  end

  it 'records correct duration after start+stop+start+stop' do
    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 0))
    stopwatch.start

    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 1))
    stopwatch.stop

    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 3))
    stopwatch.start

    Timecop.freeze(Time.local(2008, 9, 1, 10, 5, 6))
    stopwatch.stop

    expect(stopwatch.duration).to eq(1.0 + 3.0)
  end

  it 'errors when stopping when not started' do
    expect { stopwatch.stop }
      .to raise_error(
        DDMetrics::Stopwatch::NotRunningError,
        'Cannot stop, because stopwatch is not running',
      )
  end

  it 'errors when starting when already started' do
    stopwatch.start
    expect { stopwatch.start }
      .to raise_error(
        DDMetrics::Stopwatch::AlreadyRunningError,
        'Cannot start, because stopwatch is already running',
      )
  end

  it 'reports running status' do
    expect(stopwatch).not_to be_running
    expect(stopwatch).to be_stopped

    stopwatch.start

    expect(stopwatch).to be_running
    expect(stopwatch).not_to be_stopped

    stopwatch.stop

    expect(stopwatch).not_to be_running
    expect(stopwatch).to be_stopped
  end

  it 'errors when getting duration while running' do
    stopwatch.start
    expect { stopwatch.duration }
      .to raise_error(
        DDMetrics::Stopwatch::StillRunningError,
        'Cannot get duration, because stopwatch is still running',
      )
  end
end
