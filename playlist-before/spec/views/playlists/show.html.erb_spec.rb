require 'rails_helper'

RSpec.describe "playlists/show", type: :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :name => "Name",
      :description => "Description",
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
