class Inv::Batch
  attr_accessor :id, :created_at, :created_by_id

  def initialize(atts = {})
    puts "Batch.new =>"
    puts atts.inspect
    atts.each do |k,v|
      send("#{k}=",v)
    end
  end

  def transactions=(trans = [])
    @transactions = []
    trans.each do |atts|
      @transactions << Transaction.new(atts)
    end
  end

  def run
    self.created_at ||= Time.zone.now
    self.id = Inv.redis.incr("inv:batch:_id")
    Inv.redis.set("inv:batch:#{id}", JSON.generate(h))
    true
  end
end