class Models::List
  extend Forwardable
  def_delegators :to_a, :each, :map, :select, :first

  def initialize
    @index = {}
  end

  def <<(record)
    @index[record.id] = record
    self
  end

  def to_a
    @index.values
  end
  alias :all :to_a

  def find(id)
    @index[id]
  end

  def find_all(ids)
    @index.values_at(*ids).compact
  end
end