class CreateBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.integer :learn_batch_id
      t.string :batch_name

      t.timestamps
    end
  end
end
