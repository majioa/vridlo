###
# How to use
#
# context "updates locked record" do
#    UPDATE_COUNT = 5
#    before do
#       (0...UPDATE_COUNT).each do |i|
#          fork_with_new_connection do
#             # make a cuncurrent call on DB
#          end
#       end
#       Process.waitall
#    end

def fork_with_new_connection
   config = ActiveRecord::Base.remove_connection
   fork do
      begin
         ActiveRecord::Base.establish_connection(config)
         yield
      ensure
         ActiveRecord::Base.remove_connection
         Process.exit!
      end
   end
   ActiveRecord::Base.establish_connection(config)
end
