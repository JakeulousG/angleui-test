class AddNameBioToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :name, :string
    add_column :admins, :bio, :text
  end
end
