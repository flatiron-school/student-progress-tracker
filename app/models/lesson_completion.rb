class LessonCompletion < ApplicationRecord
  validates :lessons_completed, :total_lessons, presence: true
  belongs_to :student
  default_scope { order(created_at: :desc)}

  def percent_complete
    (lessons_completed).to_f / total_lessons
  end

  def recently_completed
    @lessons_completed_since_last_report ||= lessons_completed - previous_lesson_completion.lessons_completed
  end

  def previous_lesson_completion
    @previous_lesson_completion ||= student.lesson_completions.second
  end
end
