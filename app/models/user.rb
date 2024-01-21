# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  data                   :jsonb
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :moves
  has_many :opportunities, through: :moves
  has_many :companies
  has_many :documents

  def notes
    Note.where(notable: (opportunities + moves + companies))
  end

  def tasks
    Task.where(taskable: (opportunities + moves + companies))
  end

  def default_move
    moves.order(starts_on: :asc).first
  end
end
