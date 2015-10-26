require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  before(:each) do
    assign(:playlists, [
      Playlist.create!(
        :name => "Name",
        :description => "Description",
        :references => ""
      ),
      Playlist.create!(
        :name => "Name",
        :description => "Description",
        :references => ""
      )
    ])
  end

  it "renders a list of playlists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
