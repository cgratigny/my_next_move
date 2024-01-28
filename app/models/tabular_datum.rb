# == Schema Information
#
# Table name: tabular_data
#
#  id          :bigint           not null, primary key
#  description :string
#  position    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class TabularDatum < ApplicationRecord
  before_save :set_initial_position

  def set_initial_position
    self.position = self.class.order(position: :desc).first.try(:position).to_i + 1 unless self.position.present?
  end
end
