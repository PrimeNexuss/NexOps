module AnalyticsHelper
  def calculate_percentage(value, total)
    return 0 if total.zero?
    ((value.to_f / total) * 100).round(1)
  end
end
