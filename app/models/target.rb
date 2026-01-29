class Target < ApplicationRecord
    has_many :finding
    belongs_to :operation
    has_many :evidence, through: :finding
end
