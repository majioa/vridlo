class RpmSource < ApplicationRecord
   belongs_to :branch

   scope :active, -> { where(active: true) }
   scope :for_branch, ->(branch) { where(branch_id: branch) }
   scope :primary, -> { where(primary: true) }
   scope :published, -> { where(published: true) }

   validates_presence_of :name, :slug, :path, :branch
   validate :validate_path_existence

   def empty?
      rpms_count == 0
   end

   protected

   def validate_path_existence
      if self.path && !File.directory?(self.path)
         self.errors.add(:path, "#{self.path} is not exist or folder")
      end
   end
end
