# == Schema Information
#
# Table name: documents
#
#  id         :bigint           not null, primary key
#  data       :jsonb
#  file       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#
class Document < ApplicationRecord
  has_one_attached :file
  belongs_to :user

  validates :name, :file, presence: true

  has_rich_text :description
end
