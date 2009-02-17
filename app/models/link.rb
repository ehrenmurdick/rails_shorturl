class Link < ActiveRecord::Base
  
  validates_presence_of :long

  def self.find_by_short(short)
    short.to_i(36)
  end

  def short
    self[:id].to_s(36)
  end
end
