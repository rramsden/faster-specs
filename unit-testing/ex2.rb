class SignupController
  def create
    @signup = SignupForm.new(signup_params)

    if @signup.save
      redirect_to user_path(@signup.user)
    else
      render :new
    end
  end
end

###

describe SignupController
  describe "#create" do
    context 'with valid parameters' do
      it 'redirects to the user page' do
        user = double(User, id: 1)
        signup_form = double(SignupForm, save: true, user: user)
        expect(SignupForm).to receive(:new).and_return(signup_form)

        post :create, signup_params: valid_params

        expect(response).to redirect_to(user_path(user))
      end 
    end

    context 'with invalid params' do
      it 'renders the new template' do
        signup_form = double(SignupForm, save: false)
        expect(SignupForm).to receive(:new).and_return(signup_form)

        post :create, signup_parmas: invalid_params

        expect(response).to render_template(:new)
      end
    end
  end
end

# See http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/
