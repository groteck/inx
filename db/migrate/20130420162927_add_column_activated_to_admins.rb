class AddColumnActivatedToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :activated, :boolean, default: false
  end
end
