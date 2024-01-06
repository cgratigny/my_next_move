# == Schema Information
#
# Table name: moves
#
#  id          :bigint           not null, primary key
#  description :text
#  goal_on     :date
#  name        :string
#  notes_count :integer
#  starts_on   :date
#  state       :string
#  stops_on    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_moves_on_user_id  (user_id)
#
require "rails_helper"

RSpec.describe Move, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
