class Move < ApplicationRecord
  belongs_to :party
  validates :cell_id, presence: true
  validates :cell_id, uniqueness: {scope: :party_id}
end
