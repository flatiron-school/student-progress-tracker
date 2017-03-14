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

  describe 'start dates' do

    context 'four digit batch codes' do
      let(:batch) { Batch.new(batch_name: 'Web-0716') }

      it 'returns an estimated date for first day of class' do
        expect(batch.start_date.strftime).to eq('2016-07-01')
      end

      it 'can tell if class is in session' do
        expect(batch.started?).to eq(true)
      end

      it 'knows if the class is upcoming' do
        upcoming = Batch.new(batch_name: 'Web-0530')
        expect(upcoming.started?).to eq(false)
      end
    end

    context 'six digit batch codes' do
      let(:batch) { Batch.new(batch_name: 'Web-031317')}
      let(:upcoming) { Batch.new(batch_name: 'Web-052350')}

      it 'returns an estimated date for first day of class' do
        expect(batch.start_date.strftime).to eq('2017-03-13')
      end

      it 'can tell if class is in session' do
        expect(batch.started?).to eq(true)
      end

      it 'knows if the class is upcoming' do
        expect(upcoming.started?).to eq(false)
      end
    end
  end

end
