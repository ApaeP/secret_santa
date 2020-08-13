class Participant < ApplicationRecord
  belongs_to :pool
  has_many :receivers, dependent: :destroy
  has_many :gifters, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_save :associate_companion_if_present

  def associate_companion_if_present
    if self.companion_id?
      companion = Participant.find(self.companion_id)
      return if companion.companion_id != nil && companion.companion_id == self.id
      active_rec_ass_where = Participant.where(companion_id: companion.id)
      if active_rec_ass_where.count > 1
        active_rec_ass_where.each do |e|
          unless e == self
            e.companion_id = nil
            e.save
          end
        end
      end
      companion.companion_id = self.id
      companion.save
    end
  end

end
