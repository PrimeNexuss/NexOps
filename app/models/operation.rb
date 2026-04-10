class Operation < ApplicationRecord
    belongs_to :user
    has_many :targets, dependent: :destroy
    has_many :findings, through: :targets
    has_one :report, dependent: :destroy
    has_many :evidence, through: :findings
    has_many :credentials, dependent: :destroy
end
