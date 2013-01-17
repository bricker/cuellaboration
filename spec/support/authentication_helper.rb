module AuthenticationHelper
  def login
    @user ||= create(:collaborator, email: "bricker@cue.com", password: "secret")
    
    visit login_path
    within "form" do
      fill_in "email", with: @user.email
      fill_in "password", with: @user.password
      click_button "btn-login"
    end
  end
end