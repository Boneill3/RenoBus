module NextBus
  class Direction < APIObject
    attr_accessor :stops

    prop :tag
    prop :title
    prop :name

    property :use_for_ui, from: 'useForUI', transform_with: extract_value { |a| a == 'true' }

  end
end
