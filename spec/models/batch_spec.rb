require 'rails_helper'

RSpec.describe Batch, type: :model do
  it { should have_many(:students) }

  it 'is valid with a name and a learn batch ID' do
    valid_batch = Batch.new(batch_name: 'Web-0716', learn_batch_id: 404)
    expect(valid_batch).to be_valid
  end

  context 'when invalid' do

    let(:invalid_batch) { Batch.new }

    before :each do
      invalid_batch.valid?
    end

    it 'is invalid without a name' do
      expect(invalid_batch.errors.full_messages).to include("Batch name can't be blank")
    end

    it 'is invalid without a learn batch ID' do
      expect(invalid_batch.errors.full_messages).to include("Learn batch can't be blank")
    end
  end
end
