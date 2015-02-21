require 'rails_helper'

describe ProjectsController do

  context 'with no user logged in' do
    before do
      request.session[:user_id] = nil
    end

    describe "GET index" do
      before do
        get :index
      end

      it 'redirects to login' do
        expect(response).to redirect_to(log_in_path)
      end
    end
  end

  context 'with user logged in' do
    let(:project) { create(:project) }
    let(:user) { project.user }

    before do
      request.session[:user_id] = user.id
    end

    describe "GET index" do
      before do
        get :index
      end

      it "succeeds" do
        expect(response).to be_success
      end

      it "assigns @projects" do
        expect(assigns(:projects)).to include(project)
      end
    end

    describe "GET new" do
      it "can create a new project" do
        get :new
        expect(response).to be_success
      end
    end
  end
end
