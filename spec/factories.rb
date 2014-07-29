require 'factory_girl'

FactoryGirl.define do
  factory :synonym do
    details "Greeting Words"
    words "Hello,Hola,Ni Hau, Namaskara, हरि: ॐ"
    shloka "hello shloka"
  end

  factory :users, class: User do
    name "Srikanth"
    email "a@a.com"
    password "abc123"
    password_confirmation "abc123"
  end

end

