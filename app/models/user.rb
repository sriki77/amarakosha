class User < ActiveRecord::Base
  strip_attributes
  validates_presence_of :email, :name
  validates_length_of :email, :name, :within => 3..20
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :name, :with => /[A-Za-z][A-Za-z0-9]+/ , :message => "should start with alphabet; can contain digits/alphabets only"

  has_secure_password

  def as_json(options)
    super(:only => [:name, :email])
  end
end
