class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.integer :num
      t.string :str
      t.datetime :dt

      t.timestamps
    end
  end
end
