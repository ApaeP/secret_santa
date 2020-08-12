class Participant < ApplicationRecord
  belongs_to :pool
  # has_many :gifters, through: :pool, source: :draws, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :gifters, dependent: :destroy
  # has_many :receivers, through: :pool, source: :draws, dependent: :destroy
  has_many :draws, through: :pool, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  after_save :associate_companion_if_present

  def associate_companion_if_present
    # puts "\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n\n \n \n \n \n"
    # Si l'instance actuelle possède un companion
    if self.companion_id?
      # on stocke le companion dans une var
      companion = Participant.find(self.companion_id)
      # On sort de cette fonction si le companion a deja une companion_id et qu'elle correspond a l'instance actuelle
      return if companion.companion_id != nil && companion.companion_id == self.id
      # trouver la/les instance(s) qui comportai(en)t l'id de companion et la/les reset à nil
      active_rec_ass_where = Participant.where(companion_id: companion.id)
      if active_rec_ass_where.count > 1
        active_rec_ass_where.each do |e|
          unless e == self
            e.companion_id = nil
            e.save
          end
        end
      end
      # On associe au companion l'id de l'instance actuelle
      companion.companion_id = self.id
      # On sauvegarde l'instance du companion avec l'id de l'instance actuelle
      companion.save
    end
    # puts "\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n\n \n \n \n \n"
  end
end
