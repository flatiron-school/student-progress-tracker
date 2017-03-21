require 'rails_helper'

describe BatchDecorator do

  let!(:batch) { Batch.create(batch_name: 'Web-1116', learn_batch_id: 432)}
  let(:batch_decorator) { BatchDecorator.new(432)}
end
