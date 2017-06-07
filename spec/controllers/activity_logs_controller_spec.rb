require 'rails_helper'

describe Api::V1::ActivityLogsController do
  let :baby { create(:baby) }

  describe 'GET #index' do
    it "responds with status 200 OK" do
      get :index, params: { baby_id: baby.id }

      expect(response).to have_http_status(:ok)
    end

    it 'populates an array of activity logs filtered by baby' do
      baby_activity_log = create(:activity_log, baby: baby)
      create(:activity_log)

      get :index, params: { baby_id: baby.id }
      activity_logs_response = json_response

      expect(activity_logs_response)
        .to eq [serialize(baby_activity_log)]
    end
  end
end