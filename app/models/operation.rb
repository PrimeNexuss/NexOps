class Operation < ApplicationRecord
    belongs_to :user
    has_many :target
    has_many :finding, through: :target
    has_one :report
    has_many :evidence, through: :finding
    has_many :credential
end
