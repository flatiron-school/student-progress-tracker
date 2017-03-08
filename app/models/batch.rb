class Batch < ApplicationRecord
  validates :batch_name, :learn_batch_id, presence: true

  has_many :students
end
