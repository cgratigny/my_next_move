# == Schema Information
#
# Table name: notes
#
#  id           :bigint           not null, primary key
#  body         :text
#  notable_type :string
#  source       :string           default("user")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notable_id   :bigint
#  version_id   :integer
#
# Indexes
#
#  index_notes_on_notable  (notable_type,notable_id)
#
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true, counter_cache: true
  belongs_to :opportunity, class_name: "Opportunity", foreign_key: :notable_id
  belongs_to :version, class_name: "PaperTrail::Version", foreign_key: :version_id, optional: true

  accepts_nested_attributes_for :notable
  has_one :user, through: :notable

  has_rich_text :body

  validates :body, presence: true

  scope :chronological, -> { order(created_at: :asc) }
  scope :reverse_chronological, -> { order(created_at: :desc) }

  classy_enum_attr :source, enum: "NoteSource", default: :user

  after_commit :handle_notable_changes

  def handle_notable_changes
    if notable.previous_changes.any?
      self.update_columns(version_id: self.notable.versions.last.id)
    end
  end
end
