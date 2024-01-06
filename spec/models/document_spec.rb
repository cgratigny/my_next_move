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
require "rails_helper"

RSpec.describe Document, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
