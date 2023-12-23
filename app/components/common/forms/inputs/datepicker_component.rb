# frozen_string_literal: true

class Common::Forms::Inputs::DatepickerComponent < ApplicationComponent
  attr_reader :given_wrapper_options, :simple_form_input, :builder

  def attribute_name
    simple_form_input.attribute_name
  end

  def merged_input_options
    simple_form_input.send(:merge_wrapper_options, input_html_options, wrapper_options)
  end

  def input_html_options
    simple_form_input.input_html_options.deep_merge(datepicker_input_options)
  end

  def datepicker_input_options
    { data: { "datepicker-target": :input }, readonly: :true }
  end

  def wrapper_options
    given_wrapper_options
  end

end
