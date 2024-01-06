# frozen_string_literal: true

require "action_text"

class Note::FormComponent < ApplicationComponent
  include ActionText::Engine.helpers
  include ActionText::TagHelper
  attr_reader :note
end
