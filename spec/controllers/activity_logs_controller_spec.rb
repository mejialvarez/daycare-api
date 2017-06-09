require 'rails_helper'

describe Api::V1::ActivityLogsController do
  let :baby { create(:baby) }
  let :activity_log { create(:activity_log) }
  let :activity_log_params { attributes_with_foreign_keys(:activity_log) }
  let :activity_log_invalid_params { attributes_for(:activity_log_invalid) }

  describe 'GET #index' do
    it 'responds with status 200 OK' do
      get :index, params: { baby_id: baby }

      expect(response).to have_http_status(:ok)
    end

    it 'populates an array of activity logs filtered by baby' do
      baby_activity_log = create(:activity_log, baby: baby)
      activity_log

      get :index, params: { baby_id: baby }
      activity_logs_response = json_response

      expect(activity_logs_response)
        .to eq [serialize(baby_activity_log)]
    end
  end

  describe 'POST #create' do
    context 'when is successfully created' do
      before :each do
        post :create, params: { activity_log: activity_log_params }
      end

      it { should respond_with 201 }

      it 'renders the activity log json created' do
        activity_log_response = json_response

        expect(activity_log_response[:baby_id]).to eql activity_log_params['baby_id']
      end
    end

    context 'when is not created' do
      before :each do
        post :create, params: { activity_log: activity_log_invalid_params }
      end

      it { should respond_with 422 }

      it 'renders the json params errors' do
        activity_log_response = json_response
        expect(activity_log_response[:errors]).not_to eql nil
      end
    end
  end

  describe 'PUT #finish' do
    before(:each) do
      put :finish, params: { id: activity_log, activity_log: activity_log_params }
    end

    it { should respond_with 200 }

    it 'renders the activity log json finished' do
      activity_log.reload
      activity_log_response = json_response

      expect(activity_log_response[:duration])
        .to eq ((activity_log.stop_time - activity_log.start_time)/1.minutes).round
    end
  end
end