require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  let(:attr) do
    { :title => 'new title' }
  end

  let(:list) do
    @list = List.create(title: "title")
  end

  describe "GET root" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it "responds with success" do
      post :create, {list: {title: "title"}}

      expect(response.status).to eq(302)
    end
  end

  describe "POST update" do
    it "returns http success" do
      List.create(title: "title")
      put :update, {id: List.last.id, list: { title: "Add a task"}}

      expect(response.status).to eq(302)
      expect(List.last.title).to eql("Add a task") 
    end
  end
end
