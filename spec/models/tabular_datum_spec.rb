# == Schema Information
#
# Table name: tabular_data
#
#  id          :bigint           not null, primary key
#  description :string
#  position    :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe TabularDatum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
