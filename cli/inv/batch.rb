class Inv::Batch
  attr_accessor :id, :created_at, :created_by_id

  def initialize(atts = {})
    atts.each do |k,v|
      send("#{k}=",v)
    end
  end

  def transactions
    @transactions ||= []
  end

  def to_hash
    {}
  end

  def run
    Inv.post("batch", to_hash)
  end

  def self.find(id)
    json = Inv.redis.get("inv:batch:#{id}")
    if json
      self.new(JSON.parse(json))
    else
      nil
    end
  end
end