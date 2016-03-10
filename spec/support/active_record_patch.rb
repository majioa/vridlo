module SingleDbConnectionPatch
   def self.extended klass
      klass.send(:mattr_accessor, :shared_connection)
      klass.class_variable_set(:@@shared_connection, nil)
   end

   def connection
      @@shared_connection ||= retrieve_connection
   end
end
