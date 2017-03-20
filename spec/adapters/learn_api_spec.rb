require 'rails_helper'

describe LearnApi do

  before :each do
    Batch.create(batch_name: 'Web-1116', learn_batch_id: 432)
  end

  let(:learn_adapter) { LearnApi.new(432) }

  context 'when batch exists' do

    it "doesn't create duplicate batches" do
      learn_adapter.create_lesson_completions
      expect(Batch.count).to eq(1)
    end
  end

  describe 'creating student records' do

    it 'creates a list of student records' do
      learn_adapter.create_lesson_completions
      expect(Student.count).to eq(33)
    end

    it 'creates lesson completions for each student' do
      learn_adapter.create_lesson_completions
      expect(LessonCompletion.count).to eq(33)
    end

    it 'associates the data with the correct student' do
      learn_adapter.create_lesson_completions
      student = Student.find_by(github_username: 'robhitt')
      expect(student.most_recent_completion.percent_complete.round(3)).to eq(0.935)
    end
  end

end
