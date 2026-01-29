class User < ApplicationRecord
    has_many :operation
    has_many :report, through: :operation
end
