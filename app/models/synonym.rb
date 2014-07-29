class Synonym < ActiveRecord::Base
  strip_attributes
  validates_presence_of :details
  validates_uniqueness_of :details
  validates_presence_of :words
  validates_presence_of :shloka
end
