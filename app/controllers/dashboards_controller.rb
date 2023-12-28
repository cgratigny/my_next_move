class DashboardsController < ApplicationController
  before_action :build_opportunities
  before_action :build_tasks

  breadcrumb "Dashboard", [:dashboard], match: :exact

  def build_opportunities
    @opportunities = Current.user.opportunities.includes(:company).company_alphabetical.limit(4)
  end

  def build_tasks
    @tasks = Current.user.tasks.todo.chronological
  end

end
