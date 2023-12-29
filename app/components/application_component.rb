require "action_view"
require "active_support/configurable"
require "view_component/collection"
require "view_component/compile_cache"
require "view_component/slotable"
require "action_text/engine"
class ApplicationComponent < ViewComponent::Base

  include ActiveSupport::Configurable
  include ActionText::Engine.helpers 

  delegate :form_authenticity_token, :protect_against_forgery?, :config, to: :helpers

  def initialize(args = {})
    validate_keys!(args)

    args.each do |attr, value|
      instance_variable_set("@#{attr}", value)
    end
  end

  def main_app
    Rails.application.class.routes.url_helpers
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
