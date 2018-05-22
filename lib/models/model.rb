class Models::Model
  class << self
    attr_reader :fields

    def set_fields(*fields)
      @fields = [:id] + fields

      attr_accessor *@fields
    end
  end

  def initialize(attributes = {})
    attributes.each_pair do |attr, value|
      send("#{attr}=", value)
    end
  end

  def to_h
    Hash[self.class.fields.map { |field| [field.to_s, send(field)] }]
  end

  def inspect
    values = to_h.map { |k, v| "#{k}=#{v.inspect}" }.join(", ")
    "#<#{self.class.name}:#{object_id} #{values}>"
  end
end
