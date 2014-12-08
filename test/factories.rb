FactoryGirl.define do
  
  factory :user do
    email "random@chesster.com"
    encrypted_password "asdflkjsadlfkjsadlfjlkasdf"
  end
  
  factory :game do
  	association :user_id, factory: :user
  	association :player_2, factory: :user
  end

end