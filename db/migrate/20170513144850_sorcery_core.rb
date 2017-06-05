class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :name
      t.string :loginname
      t.string :mobile, :comment=>"手机"
      t.string :phone,  :comment => "电话"
      t.integer :supplier_id , :comment => "纳税人ID"
      t.integer :department_id, :comment => "部门ID"
      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
