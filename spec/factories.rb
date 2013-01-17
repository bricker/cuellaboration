FactoryGirl.define do
  factory :collaborator do
    name "Bryan Ricker"
    email "bricker@cue.com"
    password "secret"
    active true
    
    before(:create) do |collaborator|
      if collaborator.password_confirmation.blank?
        collaborator.password_confirmation = collaborator.password
      end
    end
  end
end
