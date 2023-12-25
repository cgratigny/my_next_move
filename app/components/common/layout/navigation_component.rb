# frozen_string_literal: true

class Common::Layout::NavigationComponent < ApplicationComponent

  def render?
    current_user.present?
  end
end
