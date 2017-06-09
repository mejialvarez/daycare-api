# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  full_name       :string(100)      not null
#  email           :string(100)      not null
#  phone           :integer
#  role            :integer          default("0"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
end
