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
#  tags        :string
#  tags_string :string
#  tasks_count :integer
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
  attr_accessor :tags_input

  include PgSearch::Model
  has_paper_trail
  acts_as_taggable_on :tags

  belongs_to :company
  belongs_to :move
  has_one :user, through: :move
  has_many :notes, as: :notable
  has_many :tasks, as: :taskable

  accepts_nested_attributes_for :company

  classy_enum_attr :state, enum: "OpportunityState", default: :interested
  classy_enum_attr :rating, enum: "OpportunityRating", default: :zero
  
  validates :uri, url: { allow_nil: true, allow_blank: true }

  scope :company_alphabetical, -> { joins(:company).merge(Company.all.alphabetical) }

  scope :search, -> (given_needle) { 
    where(id: global_search(given_needle) + where(company: Company.global_search(given_needle) ))
   }

   scope :by_state, -> (given_state) { where(state: given_state.to_s) }
   scope :active, -> { where(state: OpportunityState.active.map(&:to_s)) }

  pg_search_scope :global_search,
    against: [:name, :state, :tags_string],
    using: {
      tsearch: { prefix: true }
    }

  has_rich_text :body

  before_save :set_tags_string
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

  def set_tags_string
    self.tags_string = self.tag_list
  end
  
end
