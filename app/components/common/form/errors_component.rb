# frozen_string_literal: true

class Common::Form::ErrorsComponent < ApplicationComponent
  attr_reader :form

  def resource
    @resource ||= form.object
  end
end
