namespace :batches do
  desc "creates lesson completion data for each student in each batch"
  task create_lesson_completions: :environment do
    puts "Creating Lesson Completions for students in #{Batch.count} batches"
    Batch.find_each do |batch|
      LearnApi.new(batch.learn_batch_id).create_lesson_completions
    end
  end

end
