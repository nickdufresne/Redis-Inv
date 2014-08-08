require 'active_support/all'

module Inv
  autoload :Batch, File.expand_path("../inv/batch", __FILE__)

  attr_accessor :id, :created_at, :created_by_id

  def initialize(atts = {})
    atts.each do |k,v|
      send("#{k}=",v)
    end
  end
end