require 'rails_helper'

feature "playlists", js: true, slow: true, type: :feature do
  context 'index action' do
    before do
      sign_in(user)
      create(:playlist, name: "Classic Rock", user: user)
      create(:playlist, name: "Dubstep")
      visit playlists_path
    end

    context 'as an admin' do
      let(:user) { create(:admin) }

      scenario "shows all playlists" do
        expect(page).to have_content("Classic Rock")
        expect(page).to have_content("Dubstep")
      end

      scenario 'displays admin message' do
        expect(page).to have_content("Hello Admin!")
      end
    end

    context 'as a user' do
      let(:user) { create(:user) }

      scenario 'displays user message' do
        expect(page).to have_content("Hello User!")
      end

      scenario 'it doesnt show all playlists' do
        expect(page).to have_content("Classic Rock")
        expect(page).to_not have_content("Dubstep")
      end

      scenario 'it doesnt not show the edit button' do
        expect(page).to_not have_content("Edit")
      end
    end
  end

  context 'show action' do
    let(:user) { create(:user) }

    before do
      create(:playlist, name: "Classic Rock", user: user)
      sign_in(user)
      visit playlist_path Playlist.last
    end

    scenario 'doesnt show edit button' do
      expect(page).to_not have_content("Edit")
    end   

    scenario 'includes the playlist name' do
      expect(page).to have_content("Classic Rock")
    end 

    scenario 'includes playlist description' do
      expect(page).to have_content("An awesome playlist")
    end
  end

  context 'create action' do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      visit playlists_path
      click_on "New Playlist"
    end

    context 'invalid parameters' do
      scenario 'requires name' do
        click_on "Create Playlist" 
        expect(page).to have_content("Name can't be blank")
      end

      scenario 'requires description' do
        click_on "Create Playlist" 
        expect(page).to have_content("Description can't be blank")
      end
    end

    context 'valid parameters' do
      before do
        fill_in "Name", with: "Classic Rock"
        fill_in "Description", with: "Awesome Playlist"
        click_on "Create Playlist"
      end

      scenario "redirects to playlist page" do
        expect(current_path).to eq(playlist_path(id: Playlist.last))
      end

      scenario "displays success flash message" do
        expect(page).to have_content("Playlist was successfully created")
      end

      scenario "has name of playlist" do
        expect(page).to have_content("Classic Rock")
      end

      scenario "has description of playlist" do
        expect(page).to have_content("Description")
      end
    end
  end
end
