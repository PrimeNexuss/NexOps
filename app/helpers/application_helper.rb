module ApplicationHelper
  def safe_content(content)
    return content if content.html_safe?
    content.to_s.html_safe
  end

  def sanitize_params(params)
    return {} unless params.is_a?(Hash)
    
    sanitized = {}
    params.each do |key, value|
      case value
      when String
        sanitized[key] = sanitize_string(value)
      when Array
        sanitized[key] = value.map { |v| sanitize_string(v) }
      when Hash
        sanitized[key] = value.transform_values { |v| sanitize_string(v) }
      else
        sanitized[key] = value
      end
    end
    
    sanitized
  end

  private

  def sanitize_string(str)
    return str if str.nil?
    
    # Basic XSS protection
    sanitized = str.to_s.dup
    sanitized.gsub!(/<script[^>]*>.*?<\/script>/im, '')
    sanitized.gsub!(/<iframe[^>]*>.*?<\/iframe>/im, '')
    sanitized.gsub!(/javascript:/im, '')
    sanitized.gsub!(/on\w+\s*=/im, '')
    sanitized.gsub!(/<[^>]*>/im, '')
    
    sanitized
  end
end
