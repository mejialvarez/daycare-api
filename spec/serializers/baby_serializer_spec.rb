require 'rails_helper'

describe BabySerializer, type: :serializer do
  let :baby { create(:baby, birthday: 2.years.ago) }

  it "gets age in months" do
    expect(BabySerializer.new(baby).age).to eq 24
  end
end
