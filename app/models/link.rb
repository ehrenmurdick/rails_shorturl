class Link < ActiveRecord::Base
  
  validates_presence_of :long

  def self.find_by_short(short)
    find_by_id(short.to_i(36))
  end

  def short
    self[:id].to_s(36)
  end

  def to_xml
    attributes.merge(:short => short).to_xml
  end
end
