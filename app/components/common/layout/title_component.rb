# frozen_string_literal: true

class Common::Layout::TitleComponent < ApplicationComponent
  attr_reader :title, :path
  attr_accessor :priority

  def initialize(*args)
    super
    self.priority = default_priority if priority.blank?
  end

  def default_priority
    1
  end
end
