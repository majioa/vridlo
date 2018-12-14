class Branch < ApplicationRecord
   scope :filled, -> { where.not(srpms_count: 0) }

   validates_presence_of :name, :slug

   def to_param
      slug
   end

   def perpetual?
      id == 0
   end

   def undefined?
      new_record?
   end
end
