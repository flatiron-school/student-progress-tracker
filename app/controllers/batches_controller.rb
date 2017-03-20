class BatchesController < ApplicationController

  def show
    @batch = Batch.find_by(learn_batch_id: params[:learn_batch_id])
  end

end
