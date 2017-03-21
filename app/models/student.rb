class Student < ApplicationRecord
  belongs_to :batch
  has_many :lesson_completions

  def full_name
    "#{first_name} #{last_name}"
  end

  def most_recent_completion
    lesson_completions.first
  end

  def previous_completion
    lesson_completions.second
  end

end
