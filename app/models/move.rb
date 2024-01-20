# == Schema Information
#
# Table name: moves
#
#  id                   :bigint           not null, primary key
#  description          :text
#  goal_on              :date
#  metrics_count        :integer
#  metrics_total_weight :integer
#  name                 :string
#  notes_count          :integer
#  starts_on            :date
#  state                :string
#  stops_on             :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :bigint
#
# Indexes
#
#  index_moves_on_user_id  (user_id)
#
class Move < ApplicationRecord
  include Notable
  belongs_to :user

  has_many :opportunities
  has_many :companies, through: :opportunities
  has_many :metrics

  classy_enum_attr :state, enum: "MoveState", default: :open

  validates :name, presence: true
  has_rich_text :description

  def short_name
    name
  end

  def to_s
    name
  end

  def calculate_opportunity_ranking
    self.opportunities.order(total_score: :desc).metrics_enabled.each.with_index(1) do |opportunity, index| 
      opportunity.update(ranking: index)
    end
  end
end
