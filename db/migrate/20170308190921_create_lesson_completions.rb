class CreateLessonCompletions < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_completions do |t|
      t.belongs_to :student, foreign_key: true
      t.integer :days_since_last_seen
      t.integer :lessons_completed
      t.integer :total_lessons

      t.timestamps
    end
  end
end
