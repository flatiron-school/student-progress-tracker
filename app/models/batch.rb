class Batch < ApplicationRecord
  validates :batch_name, :learn_batch_id, presence: true

  has_many :students

  def started?
    start_date.past?
  end

  def start_date
    Date.parse(batch_code)
  end

  private

  def batch_code
    date_id = batch_name.split('-').last
    if date_id.length == 4
      date_id = date_id[0..1] + '01' + date_id[2..3]
    end
    date_id[4..5] + '/' + date_id[0..1] + '/' + date_id[2..3]
  end
end
