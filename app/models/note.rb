# == Schema Information
#
# Table name: notes
#
#  id           :bigint           not null, primary key
#  body         :text
#  notable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notable_id   :bigint
#
# Indexes
#
#  index_notes_on_notable  (notable_type,notable_id)
#
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true, counter_cache: true

  has_rich_text :body
end
