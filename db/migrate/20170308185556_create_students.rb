class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :github_username
      t.belongs_to :batch

      t.timestamps
    end

    add_index :students, :github_username
    add_index :students, :last_name
    add_index :students, :first_name
  end
end
