require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:batch) }
  it { should have_many(:lesson_completions)}

  context 'with lesson completions' do
    it 'has a most recent lesson completion report' do
      batch = Batch.create(batch_name: 'Web-0716', learn_batch_id: 404)
      student = batch.students.create
      lesson_completion = student.lesson_completions.create(lessons_completed: 50, total_lessons: 100)
      lesson_completion_two = student.lesson_completions.create(lessons_completed: 60, total_lessons: 100)

      expect(student.most_recent_completion).to eq(lesson_completion_two)
    end

    it 'has a previous lesson completion' do
      batch = Batch.create(batch_name: 'Web-0716', learn_batch_id: 404)
      student = batch.students.create
      lesson_completion = student.lesson_completions.create(lessons_completed: 50, total_lessons: 100)
      lesson_completion_two = student.lesson_completions.create(lessons_completed: 60, total_lessons: 100)

      expect(student.previous_completion).to eq(lesson_completion)
    end
  end


end
