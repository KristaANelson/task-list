require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe '#create' do
    it "responds with success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                          :title => 'new title',
                          :description => 'new desc',
                          :due_date => Date.today)

      post :create, { task: {:list_id => List.last.id,
                             :title => 'new title',
                             :description => 'new desc',
                             :due_date => Date.today } }

      expect(response.status).to eq(302)
    end
  end

  describe "POST update_file" do
    it "returns http success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                          :title => 'new title',
                          :description => 'new desc',
                          :due_date => Date.today)

      post :update_file, { id: @task.id, task: {title: "new"} }

      expect(response.status).to eq(302)
    end
  end

  describe "POST update" do
    it "returns http success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                          :title => 'new title',
                          :description => 'new desc',
                          :due_date => Date.today)

      post :update, { id: @task.id, task: {title: "new"} }

      expect(response.status).to eq(302)
    end
  end

  describe "GET add_file" do
    it "returns http success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                        :title => 'new title',
                        :description => 'new desc',
                        :due_date => Date.today)

      get :add_file, { id: @task.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST delete_file" do
    it "returns http success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                        :title => 'new title',
                        :description => 'new desc',
                        :due_date => Date.today)

      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      post :delete_file, { id: @task.id }

      expect(response.status).to eq(302)
    end
  end

  describe "DELETE delete_file" do
    it "returns http success" do
      @list = List.create(title: "title")
      @task = Task.create(:list_id => List.last.id,
                        :title => 'new title',
                        :description => 'new desc',
                        :due_date => Date.today)

      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      delete :destroy, { id: @task.id }

      expect(response.status).to eq(302)
    end
  end
end
