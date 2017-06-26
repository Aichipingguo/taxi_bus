class CreateAttachement < ActiveRecord::Migration
  def change
    create_table :attachements do |t|
      t.text     "description",                  comment: "描述"
      t.string   "file",                         comment: "文件名称"
      t.integer  "attachable_id",                comment: "表id"
      t.string   "attachable_type",              comment: "表类别"
      t.timestamps
      t.string   "file_name",                    comment: "自定义文件名"
      t.integer  "hit",                          comment: "下载次数"
    end

    create_table :article_catalogs do |t|
      t.string :name, :comment => '名称'
      t.string :remark, :comment => '备注'
      t.timestamps
    end
      add_column :articles, :catalog_id, :integer
      add_index :articles, :catalog_id
  end
end
