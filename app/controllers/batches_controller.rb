class BatchesController < ApplicationController

  def show
    @batch = BatchDecorator.new(learn_batch_id: params[:learn_batch_id])
  end

end
