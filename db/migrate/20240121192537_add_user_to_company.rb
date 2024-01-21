class AddUserToCompany < ActiveRecord::Migration[7.1]
  def up
    add_reference :companies, :user
    Opportunity.find_each do |opportunity|
      opportunity.company.update(user: opportunity.user)
    end
  end

  def down
    remove_column :companies, :user_id
  end
end
