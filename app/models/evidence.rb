class Evidence < ApplicationRecord
    belongs_to :finding
    has_one_attached :file_path
end
