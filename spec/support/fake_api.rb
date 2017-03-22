class FakeApi

  private

  def json_response(status_code, file_name)
    [status_code, { 'Content-Type' => 'application/json' }, [File.read("spec/fixtures/#{file_name}")]]
  end

end
