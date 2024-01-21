# frozen_string_literal: true

class Common::Layout::NavigationComponent < ApplicationComponent
  def render?
    Current.user.present? && Current.user.default_move.present?
  end

  def navigation_items
    [
      ["Dashboard", [:dashboard]],
      ["Opportunities", [:opportunities]],
      ["Moves", [:moves]],
      ["Stats", [:daily_opportunity_stats]]
    ]
  end
end
