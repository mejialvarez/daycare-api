require 'rails_helper'

describe Api::V1::ActivitiesController do
  describe 'GET #index' do
    before :each do
      4.times { create(:activity) }
      get :index
    end

    it "responds with status 200 OK" do
      expect(response).to have_http_status(:ok)
    end

    it 'populates an array of activities' do
      activities_response = json_response
      expect(activities_response.size).to eq(4)
    end
  end
end