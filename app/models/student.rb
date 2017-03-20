class Student < ApplicationRecord

  belongs_to :batch
  has_many :lesson_completions

  def full_name
    "#{first_name} #{last_name}"
  end

  def most_recent_completion
    lesson_completions_by_date.first
  end

  def lesson_completions_by_date
    lesson_completions.order(created_at: :desc)
  end

end
