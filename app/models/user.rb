class User < ApplicationRecord
  has_many :surveys, dependent: :destroy
  has_many :answers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
