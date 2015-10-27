module FeatureMacros
  def sign_in(user)
    visit root_path(locale: :en)
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password

    click_button 'Log in'
  end

  # def sign_in_as(user, path = admin_root_path)
  #   login_as user, :scope => :user
  #   visit path
  # end
end
