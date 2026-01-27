class Operation < ApplicationRecord
    belongs_to :user
    has_many :targets
    has_many :findings, through: :targets
    has_one :report
    has_many :evidences, through: :findings
    has_many :credentials
end
