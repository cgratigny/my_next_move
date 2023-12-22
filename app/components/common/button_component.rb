# frozen_string_literal: true

class Common::ButtonComponent < ApplicationComponent
  attr_reader :given_args
  attr_accessor :label, :path, :custom_args

  def args
    if custom_args.is_a?(Hash) 
      default_args.deep_merge(custom_args)
    else
      default_args
    end
  end

  def default_args
    { class: "text-slate-100 bg-cyan-900 p-2 rounded" }
    "p-1"
    "p-5"
  end
end
