class Target < ApplicationRecord
    has_many :findings, dependent: :destroy
    belongs_to :operation
    has_many :evidence, through: :findings
end
