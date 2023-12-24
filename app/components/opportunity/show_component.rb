# frozen_string_literal: true

class Opportunity::ShowComponent < ApplicationComponent
  attr_reader :opportunity

  def list?
    request.headers["Turbo-Frame"].present?
  end

  def show?
    controller.action_name == "show" && !list?
  end
end
