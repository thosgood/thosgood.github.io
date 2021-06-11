# frozen_string_literal: true

module DDMetrics
  class Summary < Metric
    def observe(value, label)
      validate_label(label)
      basic_metric_for(label, BasicSummary).observe(value)
    end

    def get(label)
      validate_label(label)
      values = basic_metric_for(label, BasicSummary).values
      DDMetrics::Stats.new(values)
    end

    def to_s
      DDMetrics::Printer.new.summary_to_s(self)
    end
  end
end
