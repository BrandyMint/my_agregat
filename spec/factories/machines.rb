# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :machine do
    category nil
    name "MyString"
    location "MyString"
    charge 1
    driver_charge 1
    description "MyText"
    specification ""
  end
end
