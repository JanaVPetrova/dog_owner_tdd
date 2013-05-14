class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :pet_name
      t.text :info
      t.string :photo
      t.boolean :status
      t.string :fplace
      t.date :fdate
      t.string :contacts

      t.timestamps
    end
  end
end
