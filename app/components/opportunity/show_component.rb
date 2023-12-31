# frozen_string_literal: true

class Opportunity::ShowComponent < ApplicationComponent
  attr_reader :opportunity, :card

  def list?
    @list ||= request.headers["Turbo-Frame"].present?
  end

  def show?
    return false if self.card.present?
    controller.action_name == "show" && !list?
  end
end
