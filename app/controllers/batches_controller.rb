class BatchesController < ApplicationController

  def show
    batch = Batch.with_completion_data.find_by(learn_batch_id: params[:learn_batch_id])
    @batch = BatchDecorator.new(batch)
  end

end
