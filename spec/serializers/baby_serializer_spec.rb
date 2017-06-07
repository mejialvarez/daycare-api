require 'rails_helper'

describe BabySerializer, type: :serializer do
  let :baby { create(:baby, birthday: 2.years.ago) }

  it "serialize attributes of a baby" do
    baby_serialized = {
      id: baby.id,
      name: baby.name,
      age: 24,
      mother_name: baby.mother_name,
      father_name: baby.father_name,
      phone: baby.phone
    }

    expect(serialize(baby)).to eq baby_serialized
  end
end
