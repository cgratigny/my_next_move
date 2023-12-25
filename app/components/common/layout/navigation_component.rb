# frozen_string_literal: true

class Common::Layout::NavigationComponent < ApplicationComponent

  def render?
    Current.user.present?
  end
end
