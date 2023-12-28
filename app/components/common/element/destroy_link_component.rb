# frozen_string_literal: true

class Common::Element::DestroyLinkComponent < ApplicationComponent
  attr_reader :model, :text, :args

  def render?
    model.present? && model.persisted?
  end

  def combined_args
    default_args.merge(args.is_a?(Hash) ? args : {})
  end

  def text
    @text || heroicon(:trash, size: 16, class: "pb-0.5 inline")
  end

  def default_args
    { class: "mt-2 rounded-lg py-3 font-medium", method: :delete, form: { data: { turbo_confirm: 'Are you sure?' }, class: "inline" } }
  end
end
