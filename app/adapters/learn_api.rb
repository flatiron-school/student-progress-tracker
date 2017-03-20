class LearnApi

  BASE_URL = 'http://www.learn.co/api'

  def initialize(batch_name:, batch_id:)
    @batch_id                  = batch_id
    @batch_name                = batch_name
    @lesson_completion_reports = fetch_batch_students
  end

  def create_lesson_completions
    lesson_completion_reports.each.with_index(1) do |completion_report, index|
      batch = Batch.find_or_create_by(learn_batch_id: batch_id, batch_name: batch_name)
      student = Student.find_or_initialize_by(github_username: completion_report['github_username'], batch_id: batch.id)
      student_name = completion_report["full_name"].split(" ")
      student.update_attributes(first_name: student_name.first, last_name: student_name.last)
      days_since_last_seen = Date.today - Date.parse(completion_report["last_seen_at"])

      student.lesson_completions.build(
        days_since_last_seen: days_since_last_seen,
        lessons_completed: completion_report["completed_lessons_count"],
        total_lessons: completion_report["total_lessons_count"]
      )
      student.save
    end
  end

  private
  attr_reader :batch_id, :lesson_completion_reports, :batch_name
  def fetch_batch_students
    url = "#{BASE_URL}/v1/batches/#{@batch_id}/batch_students"
    HTTParty.get(url)
  end

end
