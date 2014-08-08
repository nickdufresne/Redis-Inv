class Inv::Transaction
  attr_accessor :item, :lot, :src, :dest, :qty, :unit, :total, :status

  STATUSES = ["COMPLETE", "PENDING"]

  def source_queue_key
    "coord:#{item}:#{lot}:#{src}:#{status}:#{unit}"
  end

  def destination_queue_key
    "coord:#{item}:#{lot}:#{dest}:#{status}:#{unit}"
  end

  def initialize(atts = {})
    atts.each do |k,v|
      send("#{k}=", v)
    end
  end
end