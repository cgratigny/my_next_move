# == Schema Information
#
# Table name: opportunities
#
#  id          :bigint           not null, primary key
#  applied_on  :date
#  body        :text
#  data        :jsonb
#  description :text
#  name        :string
#  notes_count :integer
#  pay_maximum :integer
#  pay_minimum :integer
#  pay_period  :string
#  posted_on   :string
#  rating      :string
#  state       :string
#  uri         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  move_id     :bigint
#
# Indexes
#
#  index_opportunities_on_company_id  (company_id)
#  index_opportunities_on_move_id     (move_id)
#
class Opportunity < ApplicationRecord
  include PgSearch::Model
  has_paper_trail

  belongs_to :company, counter_cache: true
  belongs_to :move
  has_many :notes, as: :notable

  accepts_nested_attributes_for :company

  classy_enum_attr :state, enum: "OpportunityState", default: :interested
  classy_enum_attr :rating, enum: "OpportunityRating", default: :one
  
  validates :uri, url: { allow_nil: true, allow_blank: true }

  scope :company_alphabetical, -> { joins(:company).merge(Company.all.alphabetical) }

  scope :search, -> (given_needle) { 
    where(id: global_search(given_needle) + where(company: Company.global_search(given_needle) ))
   }

  pg_search_scope :global_search,
    against: [:name, :state],
    using: {
      tsearch: { prefix: true }
    }

  has_rich_text :body

  validates :name, presence: true

  before_validation :set_name_from_uri_title

  def set_name_from_uri_title
    return if self.name.present?
    return if self.uri.blank?
    agent = Mechanize.new
    page = agent.get(self.uri)
    self.name = page.title
  rescue
    # this means we weren't able to get the name, not a big deal
  end

  def to_s
    self.name
  end

  def short_name
    self.name.truncate(20)
  end
  
  def destroy
    raise
  end
  
end
