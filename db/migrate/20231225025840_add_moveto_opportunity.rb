class AddMovetoOpportunity < ActiveRecord::Migration[7.1]
  def change
    add_reference :opportunities, :move
  end
end
