class DashboardsController < ApplicationController
  before_action :redirect_if_no_default_move
  before_action :build_opportunities
  before_action :build_tasks

  breadcrumb "Dashboard", [:dashboard], match: :exact

  def build_opportunities
    @opportunities = Current.user.opportunities.includes(:company).active.company_alphabetical.limit(4)
  end

  def build_tasks
    @tasks = Current.user.tasks.todo.chronological
  end

  def redirect_if_no_default_move
    if Current.user.default_move.nil?
      redirect_to [:new, :move]
    end
  end
end
