# == Schema Information
#
# Table name: quotes
#
#  id         :bigint           not null, primary key
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Quote < ApplicationRecord
  acts_as_list

  validates :name, presence: true

  broadcasts_to ->(quote) { "quotes" }, inserts_by: :append
end
