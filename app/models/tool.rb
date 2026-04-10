class Tool < ApplicationRecord
    has_many :findings, dependent: :destroy
end
