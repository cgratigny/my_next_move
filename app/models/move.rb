# == Schema Information
#
# Table name: moves
#
#  id          :bigint           not null, primary key
#  description :text
#  goal_on     :date
#  name        :string
#  notes_count :integer
#  starts_on   :date
#  state       :string
#  stops_on    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_moves_on_user_id  (user_id)
#
class Move < ApplicationRecord
  belongs_to :user

  has_many :opportunities
  has_many :companies, through: :opportunities

  has_many :notes, as: :notable

  validates :name, presence: true
  has_rich_text :description

  def short_name
    self.name
  end
end
