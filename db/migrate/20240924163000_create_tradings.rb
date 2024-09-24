class CreateTradings < ActiveRecord::Migration[7.1]
  def change
    create_table :tradings do |t|
      t.float :value
      t.datetime :time

      t.timestamps
    end
  end
end
