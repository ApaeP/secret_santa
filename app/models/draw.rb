class Draw < ApplicationRecord
  belongs_to :pool

  has_many :gifters, dependent: :destroy
  has_many :receivers, dependent: :destroy

  after_create :create_gifters_and_receivers

  private

  def single_association(gifter, participants_array, to_avoid)
    array = participants_array.except(to_avoid)
    participant_to_associate = array[rand(array.count)]
    # \/ The line below raises a "NoMethodError (undefined method `id' for nil:NilClass)" 5% of the time.
    # But [self, participant_to_associate, gifter].include?(nil) always return false... WHY?
    Receiver.create(draw_id: self.id, participant_id: participant_to_associate.id, gifter_id: gifter.id)
    participants_array.delete(participant_to_associate)
  end

  def associate_gifters_and_receivers(gifters)
    p_arr = []
    self.pool.participants.each { |p| p_arr << p }
    gifters.each do |gifter|
      if gifter.participant.companion_id.nil?
        to_avoid = Participant.find(gifter.participant.id)
        single_association(gifter, p_arr, to_avoid)
      else
        to_avoid = [Participant.find(gifter.participant.id), Participant.find(gifter.participant.companion_id)]
        single_association(gifter, p_arr, to_avoid)
      end
    end
  end

  def create_gifters_and_receivers
    g_arr = []
    r_arr = []
    self.pool.participants.each do |part|
      g_arr << Gifter.create(draw_id: self.id, participant_id: part.id)
      # r_arr << Receiver.create(draw_id: self.id, participant_id: part.id)
    end
    associate_gifters_and_receivers(g_arr)
  end
end
