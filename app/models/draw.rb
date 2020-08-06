class Draw < ApplicationRecord
  belongs_to :pool

  has_many :gifters, dependent: :destroy
  has_many :receivers, dependent: :destroy

  after_create :create_gifters_and_receivers

  def associate_participants(gifters_arr, receivers_arr)
    count = receivers_arr.length
    gifters_arr.each do |gifter|
      random = rand(count)
      receiver = receivers_arr[random]
      receivers_arr.delete_at(random)
      count -= 1
      receiver.gifter = gifter
      receiver.save
    end
  end

  def create_gifters_and_receivers
    g_arr = []
    r_arr = []
    self.pool.participants.each do |part|
      g_arr << Gifter.create(draw_id: self.id, participant_id: part.id)
      r_arr << Receiver.new(draw_id: self.id, participant_id: part.id)
    end
    associate_participants(g_arr, r_arr)
  end
end
