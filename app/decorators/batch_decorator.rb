class BatchDecorator < BaseDecorator

  def percentage_complete_for(student)
    number_to_percentage( student.most_recent_completion.percent_complete * 100)
  end

  def students_lessons_complete
    students.map { |student| [student.full_name, student.most_recent_completion.lessons_completed]}
  end

  def students_percent_complete
    students.map {|student| [student.full_name, percentage_complete_for(student).to_f]}
  end
end
