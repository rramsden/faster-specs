module ControllerMacros
  def login
    before do
      unless user.nil?
        @request.env["devise.mapping"] = Devise.mappings[:user]
        allow(@controller).to receive(:current_user) { user }
        sign_in :user, user
      end
    end
  end
end
