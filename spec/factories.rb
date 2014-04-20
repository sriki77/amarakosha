require 'factory_girl'

FactoryGirl.define do
  factory :synonym do
    details "Greeting Words"
    words "Hello,Hola,Ni Hau, Namaskara, हरि: ॐ"
  end

  factory :user do
    name "Srikanth"
    email "a@a.com"
    password "abc123"
    password_confirmation "abc123"
  end

end

