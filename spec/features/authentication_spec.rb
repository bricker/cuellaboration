require 'spec_helper'

describe "logging in" do
  before :each do
    @user = create(:collaborator, email: "bricker@cue.com", password: "secret")
  end
  
  it "redirects to root path if already logged in" do
    login
    visit login_path
    current_path.should eq root_path
  end
  
  it "redirects to login path if not logged in" do
    visit collaborators_path
    current_path.should eq login_path
    page.should have_css ".alert-error"
  end

  #--------------------
  
  context "with incorrect information" do
    it "redirects me back to the login page" do
      visit login_path
      within "form" do
        fill_in "email", with: "wrong"
        fill_in "password", with: "incorrect"
        click_button "btn-login"
      end
      
      current_path.should eq login_path
      page.should have_css ".alert-error"
    end
  end
  
  #--------------------
  
  context "as an inactive user" do
    it "won't let me login" do
      @user.update_attribute(:active, false)
      login
      current_path.should eq login_path
      page.should have_css ".alert-error"
    end
  end
  
  #--------------------
  
  context "with correct login information" do
    it "redirects to the root path by default" do
      visit login_path
      within "form" do
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "btn-login"
      end

      page.should have_css ".alert-success"
      current_path.should eq root_path
    end
    
    it "redirects to the requested path if exists" do
      visit collaborators_path
      current_path.should eq login_path
      
      within "form" do
        fill_in "email", with: @user.email
        fill_in "password", with: @user.password
        click_button "btn-login"
      end

      page.should have_css ".alert-success"
      current_path.should eq collaborators_path
    end
  end
end

#--------------------

describe "logout" do  
  it "redirects to login path" do
    login
    visit logout_path
    current_path.should eq login_path
    page.should have_css ".alert-success"
  end
end
