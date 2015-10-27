require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  let(:user) { build :user }
  let(:admin) { build :admin }

  before(:each) do
    assign(:playlists, [
      Playlist.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  context 'as an admin' do
    let(:current_user) { admin }

    it 'displays admin message' do
      render template: "playlists/index.html", locals: { current_user: current_user }
      expect(rendered).to have_content("Hello Admin!")
    end 

    it 'displays an edit button' do
      render template: "playlists/index.html", locals: { current_user: current_user }
      expect(rendered).to have_content("Edit")
    end
  end

  context 'as a user' do
    let(:current_user) { user }

    it 'displays admin message' do
      render template: "playlists/index.html", locals: { current_user: current_user }
      expect(rendered).to have_content("Hello User!")
    end 
  end
end
