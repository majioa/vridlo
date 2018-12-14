module EnableMatcherBlock
   def supports_block_expectations?
      true
   end

   def matches? actual, &block
      if actual.is_a?(Proc)
         super(actual[], &block)
      else
         super(actual, &block)
      end
   end
end

RSpec::Matchers::BuiltIn::ContainExactly.include(EnableMatcherBlock)
