# frozen_string_literal: true

class Common::Layout::NoticesComponent < ApplicationComponent

  def render?
    notice.present?
  end

  def notice
    helpers.notice
  end
end
