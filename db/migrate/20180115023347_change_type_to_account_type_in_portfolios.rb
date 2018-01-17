class ChangeTypeToAccountTypeInPortfolios < ActiveRecord::Migration[5.1]
  def change
    rename_column :portfolios, :type, :account_type
  end
end
