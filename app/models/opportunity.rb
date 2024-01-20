# == Schema Information
#
# Table name: opportunities
#
#  id          :bigint           not null, primary key
#  applied_on  :date
#  data        :jsonb
#  name        :string
#  notes_count :integer
#  pay_maximum :integer
#  pay_minimum :integer
#  pay_period  :string
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
  include Notable
  attr_accessor :tags_input, :quick_add

  attr_accessor :company_name, :search

  include PgSearch::Model
  has_paper_trail
  acts_as_taggable_on :tags

  belongs_to :company
  belongs_to :move
  has_one :user, through: :move
  has_many :tasks, as: :taskable

  accepts_nested_attributes_for :company

  classy_enum_attr :state, enum: "OpportunityState", default: :interested
  classy_enum_attr :rating, enum: "OpportunityRating", default: :zero

  validates :uri, url: {allow_nil: true, allow_blank: true}
  before_save :set_applied_on

  scope :company_alphabetical, -> { joins(:company).merge(Company.all.alphabetical) }

  scope :search, ->(given_needle) {
                   where(id: global_search(given_needle) + where(company: Company.global_search(given_needle)))
                 }
  scope :state, -> (given_needle) { by_state(given_needle.to_s.downcase) }

  scope :by_state, ->(given_state) { where(state: given_state.to_s) }
  scope :active, -> { where(state: OpportunityState.active.map(&:to_s)) }

  pg_search_scope :global_search,
    against: [:name, :state, :tags_string],
    using: {
      tsearch: {prefix: true}
    }

  before_save :set_tags_string
  validates :name, presence: true

  before_validation :set_name_from_uri_title
  before_validation :process_company_name

  def set_name_from_uri_title
    return if name.present?
    return if uri.blank?
    return unless quick_add.present?

    assign_attributes(
      OpportunityUrlParserService.new(uri: uri).perform
    )
    # rescue
    # this means we weren't able to get the name, not a big deal
  end

  def process_company_name
    return if company_name.nil?
    found_company = user.companies.find_by(name: company_name)
    self.company = if found_company.present?
      found_company
    else
      Company.new(name: company_name)
    end
  end

  def set_applied_on
    if applied_on.nil? && state.application_submitted?
      self.applied_on = Time.zone.now.to_date
    end
  end

  def to_s
    name
  end

  def embedded_params_to_permit
    [:id, :state]
  end

  def short_name
    name.truncate(20)
  end

  def set_tags_string
    self.tags_string = tag_list
  end
end
