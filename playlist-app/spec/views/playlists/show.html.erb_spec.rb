require 'rails_helper'

RSpec.describe "playlists/show", type: :view do
  before(:each) do
    assign(:playlist, Playlist.create!(
      :name => "Name",
      :description => "Description"
    ))
  end

  context 'as an admin' do
    let(:user) { build :admin } 

    it 'displays an edit button' do
      render template: "playlists/show.html", locals: { current_user: user } 
      expect(rendered).to have_content("Edit")
    end
  end

  context 'as a user' do
    let(:user) { build :user }

    it "renders attributes in <p>" do
      render template: "playlists/show.html", locals: { current_user: user }
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/Description/)
    end
  end
end
