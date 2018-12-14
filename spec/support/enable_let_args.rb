module RSpec
   module Core
      module MemoizedHelpers
         module ClassMethods
            def let(name, &block)
               raise "#let or #subject called without a block" if block.nil?
               raise(
                     "#let or #subject called with a reserved name #initialize"
               ) if :initialize == name

               MemoizedHelpers.module_for(self).__send__(:define_method, name, &block)

               if block.arity >= 1
                  define_method(name, Proc.new {|*args| __memoized.fetch_or_store(name) { super(RSpec.current_example, *args, &nil) } })
               else
                  define_method(name) { __memoized.fetch_or_store(name) { super(&nil) } }
               end
            end
         end
      end
   end
end
