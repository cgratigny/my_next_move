class ApplicationComponent < ViewComponent::Base

  def initialize(args = {})
    validate_keys!(args)

    args.each do |attr, value|
      instance_variable_set("@#{attr}", value)
    end
  end

  def current_user
    Current.user
  end

  private

  def validate_keys!(attributes)
    if !attributes.is_a?(Hash)
      raise ArgumentError, "Hash expected, given #{attributes.class.name}"
    end

    attributes.keys.each do |key|
      unless self.respond_to?(key)
        raise ArgumentError, "Invalid attribute: #{key}"
      end
    end
  end

  def method_missing(m, *args, &block)
    if m.to_s.end_with?("?") && self.respond_to?(m.to_s.chomp("?"))
      self.send(m.to_s.chomp("?")).to_s.to_boolean
    else
      super
    end
  end
end
