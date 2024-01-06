# frozen_string_literal: true

class Common::Element::ButtonComponent < ApplicationComponent
  attr_reader :given_args, :icon
  attr_accessor :label, :path, :custom_args

  def args
    if custom_args.is_a?(Hash)
      default_args.deep_merge(custom_args)
    else
      default_args
    end
  end

  def default_args
    {class: "text-slate-100 bg-cyan-900 p-2 rounded"}
  end

  def submit_button_args
    default_args
  end
end
