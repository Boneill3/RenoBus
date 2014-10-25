module NextBus
  class APIObject < Hashie::Trash
    class << self
      private

      def extract_value
        lambda do |attr|
          block_given? ? yield(attr.value) : attr.value
        end
      end

      def prop(name, &block)
        property name, from: name.to_s.camelize(:lower), transform_with: extract_value(&block)
      end

    end
  end
end
