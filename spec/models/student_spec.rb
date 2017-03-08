require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:batch) }
end
