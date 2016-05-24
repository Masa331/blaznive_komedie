class ComedyComment < ApplicationRecord
  belongs_to :user
  belongs_to :comedy
end
