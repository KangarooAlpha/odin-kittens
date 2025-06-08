class ChangeColumnsToIntegers < ActiveRecord::Migration[8.0]
  def change
    change_column :kittens, :cuteness, :integer
    change_column :kittens, :softness, :integer
  end
end
