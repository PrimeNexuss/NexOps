class Finding < ApplicationRecord
    has_many :evidence, dependent: :destroy
    belongs_to :operation
    belongs_to :target
    belongs_to :tool, optional: true
    
    before_validation :set_operation_from_target
    
    private
    
    def set_operation_from_target
      self.operation = target.operation if target && !operation_id
    end
end
