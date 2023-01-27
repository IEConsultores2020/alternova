class CreateChucknorris < ActiveRecord::Migration[7.0]
  def change
    create_table :chucknorris do |t|
      t.string :joke

      t.timestamps
    end
  end
end
