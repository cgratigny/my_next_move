# frozen_string_literal: true

class Common::Layout::NavigationComponent < ApplicationComponent

  def render?
    Current.user.present?
  end

  def navigation_items
    [
      [ "Dashboard", [:dashboard] ],
      [ "Moves", [:moves] ],
      [ "Opportunities", [:opportunities] ],
      [ "Companies", [:companies] ],
      [ "Notes", [:notes] ],
      [ "Documents", [:documents] ],
    ]
  end
end
