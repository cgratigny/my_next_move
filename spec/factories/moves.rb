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
FactoryBot.define do
  factory :move do
    name { Forgery('lorem_ipsum').title }
    user { create(:user) }
  end
end
