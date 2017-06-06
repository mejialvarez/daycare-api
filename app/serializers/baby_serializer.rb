class BabySerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :mother_name, :father_name, :phone

  def age
  	(Date.today.year * 12 + Date.today.month) - (object.birthday.year * 12 + object.birthday.month)
  end
end