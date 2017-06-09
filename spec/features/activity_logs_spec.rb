require 'rails_helper'

feature "Activity logs", type: :feature do
  let :baby { create(:baby) }
  let :assistant { create(:assistant) }

  scenario "filter activity logs" do
    activity_log = create(:activity_log, baby: baby, assistant: assistant)
    create(:activity_log)

    visit activity_logs_path

    select activity_log.baby.name, from: "baby"
    select activity_log.assistant.name, from: "assistant"
    select activity_log.status.humanize, from: "status"

    click_button 'Filtrar'

    expect(page).to have_selector('.activity-log', count: 1)
  end
end