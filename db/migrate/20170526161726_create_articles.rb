class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :name
      t.text     :abstract
      t.text     :content
      t.boolean  :published, default: false
      t.integer  :user_id
      t.timestamps null: false
    end
  end
end
