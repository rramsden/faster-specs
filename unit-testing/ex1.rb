class SignupController
  def create
    @user = User.new(user_params)
    @user.account = Account.new(account_params)

    if @user.valid? && @user.account.valid?
      @user.save!
      @user.account.save!

      # Subscribe customer to mailing list
      MailingList.subscribe(@user)

      redirect_to user_path(@user)
    else
      render :new
    end
  end
end

###

describe SignupController do
  describe "#create" do
    context 'with valid parameters' do
      it "redirects to the user page" do
        # ...
      end

      it 'creates an account' do
        # ... 
      end

      it 'subscribes the user to the mailing list' do
        # ...   
      end
    end

    context 'with invalid parameters' do
      context 'when user parameters are invalid' do
        # ...    
      end

      context 'when account parameters are invalid' do
        # ... 
      end
    end
  end 
end
