# frozen_string_literal: true

class Common::Layout::BreadcrumbsComponent < ApplicationComponent

  def breadcrumb_trail
    helpers.breadcrumb_trail
  end

  def render?
    current_user.present?
  end

end
