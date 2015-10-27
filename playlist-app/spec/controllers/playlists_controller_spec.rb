require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  let(:user) { create :user }
  login

  let(:valid_attributes) { {
    name: "Playlist",
    description: "Description"
  } }

  let(:invalid_attributes) { {
    bad: "Playlist"
  } }

  describe "GET #show" do
    it "assigns the requested playlist as @playlist" do
      playlist = Playlist.create! valid_attributes
      get :show, {:id => playlist.to_param}
      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "GET #new" do
    it "assigns a new playlist as @playlist" do
      get :new, {}
      expect(assigns(:playlist)).to be_a_new(Playlist)
    end
  end

  describe "GET #edit" do
    it "assigns the requested playlist as @playlist" do
      playlist = Playlist.create! valid_attributes
      get :edit, {:id => playlist.to_param}
      expect(assigns(:playlist)).to eq(playlist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Playlist" do
        expect {
          post :create, {:playlist => valid_attributes}
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, {:playlist => valid_attributes}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, {:playlist => valid_attributes}
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist as @playlist" do
        post :create, {:playlist => invalid_attributes}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, {:playlist => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { {
        name: "New",
        description: "Desc"
      } }

      it "updates the requested playlist" do
        playlist = Playlist.create! valid_attributes
        put :update, {:id => playlist.to_param, :playlist => new_attributes}
        playlist.reload
      end

      it "assigns the requested playlist as @playlist" do
        playlist = Playlist.create! valid_attributes
        put :update, {:id => playlist.to_param, :playlist => valid_attributes}
        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to the playlist" do
        playlist = Playlist.create! valid_attributes
        put :update, {:id => playlist.to_param, :playlist => valid_attributes}
        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist as @playlist" do
        playlist = Playlist.create! valid_attributes
        put :update, {:id => playlist.to_param, :playlist => invalid_attributes}
        expect(assigns(:playlist)).to eq(playlist)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested playlist" do
      playlist = Playlist.create! valid_attributes
      expect {
        delete :destroy, {:id => playlist.to_param}
      }.to change(Playlist, :count).by(-1)
    end

    it "redirects to the playlists list" do
      playlist = Playlist.create! valid_attributes
      delete :destroy, {:id => playlist.to_param}
      expect(response).to redirect_to(playlists_url)
    end
  end
end
