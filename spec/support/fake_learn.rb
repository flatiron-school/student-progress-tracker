class FakeLearn < FakeApi

  def call(env)
    json_response 200, 'batch_students.json'
  end

end
