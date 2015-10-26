require 'rails_helper'

feature "playlists", js: true, type: :feature do
  context 'index action' do
    before do
      create(:playlist, name: "Classic Rock", user: user)
      create(:playlist, name: "Dubstep")
      sign_in(user)
      visit playlist_path
    end

    context 'as an admin' do
      let(:user) { create(:admin) }

      scenario "shows all playlists" do
        expect(page).to have_content("Classic Rock")
        expect(page).to have_content("Dubstep")
      end

      scenario 'displays admin message' do
        expect(page).to have_content("Hi Admin!")
      end
    end

    context 'as a user' do
      let(:user) { create(:user) }

      scenario 'it doesnt show all playlists' do
        expect(page).to have_content("Classic Rock")
        expect(page).to_not have_content("Dubstep")
      end

      scenario 'displays user message' do
        expect(page).to have_content("Hi User!")
      end

      scenario 'it doesnt not show the user column' do
        expect(page).to_not have_content("User")
      end
    end
  end

  context 'show action' do
    context 'as an admin' do
      scenario 'shows an edit button' do
        expect(page).to have_content("Edit")
      end   
    end

    scenario 'includes the playlist name' do
      expect(page).to have_content("Playlist Name")
    end 

    scenario 'includes playlist description' do
      expect(page).to have_content("Playlist Description")
    end
  end

  context 'create action' do
    before do
      visit paylists_path
      click_on "New Playlist"
    end

    context 'invalid parameters' do
      scenario 'requires name' do
        click_on "Create" 
        expect(page).to have_content("Name can't be blank")
      end

      scenario 'requires description' do
        click_on "Create" 
        expect(page).to have_content("Description can't be blank")
      end
    end

    context 'valid parameters' do
      scenario "redirects to playlist page" do
        expect(current_path).to eq(playlist_path(Playlist.last))
      end

      scenario "displays success flash message" do
        expect(page).to have_content("Playlist was successfully created")
      end
    end
  end
end
