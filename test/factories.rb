FactoryGirl.define do
  
  factory :user, aliases: [:player, :opponent] do    
    sequence :email do |n|
      "random#{n}@chesster.com"
    end
    password "omglolhahaha"
    password_confirmation "omglolhahaha"
  end
  
  factory :game do
  	association :user, factory: :player
  	association :opponent, factory: :opponent
  	title "Hello"
  end

end
