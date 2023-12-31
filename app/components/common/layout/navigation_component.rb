# frozen_string_literal: true

class Common::Layout::NavigationComponent < ApplicationComponent

  def render?
    Current.user.present?
  end

  def navigation_items
    [
      [ "Dashboard", [:dashboard] ],
      [ "Opportunities", [:opportunities] ],
      [ "New", [:new, :opportunity], { class: "ml-4" }],
      [ "Moves", [:moves] ],
      # [ "Companies", [:companies] ],
      # [ "Notes", [:notes] ],
      # [ "Tasks", [:tasks] ],
      # [ "Documents", [:documents] ],
    ]
  end
end