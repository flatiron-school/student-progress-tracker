require 'rails_helper'

RSpec.describe LessonCompletion, type: :model do
  it { should belong_to(:student) }
  it { should validate_presence_of(:total_lessons)}
  it { should validate_presence_of(:lessons_completed)}
  it {should have_db_column(:lessons_completed).of_type(:integer) }
  it {should have_db_column(:total_lessons).of_type(:integer) }
  it {should have_db_column(:days_since_last_seen).of_type(:integer) }

  context 'displaying statistics' do
    it 'returns the students completion percentage' do
      student = Student.new
      lesson_completion = student.lesson_completions.build(lessons_completed: 50, total_lessons: 100)
      expect(lesson_completion.percent_complete).to eq(0.50)
    end

    it 'knows the number of lessons completed since the last report' do
      batch = Batch.create(batch_name: 'Web-0716', learn_batch_id: 404)
      student = batch.students.create
      lesson_completion = student.lesson_completions.create(lessons_completed: 50, total_lessons: 100)
      lesson_completion_two = student.lesson_completions.create(lessons_completed: 60, total_lessons: 100)

      expect(lesson_completion_two.recently_completed).to eq(10)
    end

  end
end
