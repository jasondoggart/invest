class Portfolio < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :account_type, :description
end
