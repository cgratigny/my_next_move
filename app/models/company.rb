# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  timestamps :string
#  uri        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
  has_many :opportunities

  validates :name, presence: true
  validates :uri, url: { allow_nil: true, allow_blank: true }
end
