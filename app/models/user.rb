class User < ApplicationRecord
    has_many :operations
    has_many :reports, through: :operations
end
