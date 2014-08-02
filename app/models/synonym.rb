class Synonym < ActiveRecord::Base
  strip_attributes
  validates_presence_of :summary
  validates_uniqueness_of :summary
  validates_presence_of :words
  validates_presence_of :shloka

  def matched_word=(w)
    @mword=w
  end

  def matched_word
    @mword
  end
end
