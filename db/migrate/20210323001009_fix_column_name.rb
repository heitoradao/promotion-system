class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :promotions, :discount, :discount_rate
  end
end
