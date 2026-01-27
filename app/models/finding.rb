class Finding < ApplicationRecord
    has_many :Evidence, dependent: :destroy
    belongs_to :operation
    belongs_to :target
    belongs_to :tool, optional: true
end
