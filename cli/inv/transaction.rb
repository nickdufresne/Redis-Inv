class Inv::Transaction
  attr_accessor :item_id, :lot_id, :qty, :unit, :total, :locator_id
  def initialize(atts = {})
    atts.each do |k,v|
      send("#{k}=",v)
    end
  end
end