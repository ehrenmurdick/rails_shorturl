class Link < ActiveRecord::Base
  
  validates_presence_of :long
  before_create :create_short

  def self.find_by_key(s)
    find_by_short(s.to_i(36))
  end

  def self.find_a_hole
    sql =<<-END
SELECT links1.short + 1 AS start  
  FROM links AS links1
  LEFT OUTER JOIN links AS r ON links1.short + 1 = r.short
  WHERE r.id IS NULL
    END
    connection.select_value(sql).to_i
  end

  def short
    self[:short].to_s(36)
  end

  def to_xml
    attributes.merge(:short => short).to_xml
  end

  def create_short
    self.short = Link.find_a_hole
  end
end
