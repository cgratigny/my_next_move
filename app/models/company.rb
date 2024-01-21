# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  name              :string
#  opportunity_count :integer
#  timestamps        :string
#  uri               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :bigint
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#
class Company < ApplicationRecord
  include PgSearch::Model
  has_paper_trail

  has_many :opportunities
  belongs_to :user

  validates :name, presence: true
  validates :uri, url: {allow_nil: true, allow_blank: true}

  scope :alphabetical, -> { order(name: :asc) }

  pg_search_scope :global_search,
    against: [:name],
    using: {
      tsearch: {prefix: true}
    }
end
