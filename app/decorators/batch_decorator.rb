class BatchDecorator
  attr_reader :batch, :students
  include ActionView::Helpers::NumberHelper

  def initialize(opts)
    @batch = Batch.with_completion_data.find_by(opts)
    @students = batch.students
  end

  def batch_name
    batch.batch_name
  end

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
