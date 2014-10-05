def sign_in
  user = Fabricate(:user)
  visit root_path
  click_button "Sign In"
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  within('.main-content') do
    click_button "Sign In"
  end
end
