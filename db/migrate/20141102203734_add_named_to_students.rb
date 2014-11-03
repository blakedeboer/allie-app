class AddNamedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :named, :boolean
  end
end
