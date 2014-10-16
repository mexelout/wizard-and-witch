class Field < ActiveRecord::Base
  serialize :ground
  serialize :backbuild
  serialize :forebuild
  def self.convert_array(h)
    return h.map{|k,a|a.map{|n|n.to_i}}
  end
  def self.convert_split_type_string(ary)
    return ary.map{|a|a.join(",")}.join("&")
  end
end
