class Target < ApplicationRecord
    has_many :findings
    belongs_to :operation
    has_many :evidences, through: :findings
end
