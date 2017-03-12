class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :headline
      t.string :subtitle
      t.string :body

      t.timestamps
    end
  end
end
