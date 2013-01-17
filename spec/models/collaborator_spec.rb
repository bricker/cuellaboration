require 'spec_helper'

describe Collaborator do
  describe '#downcase_email' do
    it "runs before save if email_changed?" do
      user = create :collaborator, email: "BRicker@gmail.com"
      user.email.should eq "bricker@gmail.com"
      
      user.email = "BryanRicker@gmail.com"
      user.save!
      user.email.should eq "bryanricker@gmail.com"
    end
  end
  
  #--------------------------
  
  describe '::authenticate' do
    let(:user) { create :collaborator, email: "bricker@cue.com", password: "secret" }
    
    it "returns the user if information is correct" do
      Collaborator.authenticate(email: user.email, password: user.password).should eq user
    end
    
    it "returns false if e-mail doesn't exist" do
      Collaborator.authenticate(email: "wrong@wrong.wrong", password: user.password).should eq false
    end
    
    it "returns false if password is incorrect" do
      Collaborator.authenticate(email: user.email, password: "wrong").should eq false
    end
  end
  
  #--------------------------
  
  describe '#generate_password' do
    it "generates a password" do
      user = build :collaborator, password: nil
      user.generate_password
      
      user.password.should be_present
      user.password_confirmation.should eq user.password
    end
    
    it "runs on create if password is blank" do
      user = build :collaborator, password: nil
      user.should_receive(:generate_password)
      user.save
    end
    
    it "doesn't run on create if password is present" do
      user = build :collaborator, password: "secret"
      user.should_not_receive(:generate_password)
      user.save!
    end
    
    it "doesn't run on update" do
      user = create :collaborator
      user.should_not_receive(:generate_password)
      user.save!
    end
  end
end
