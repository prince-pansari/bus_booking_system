class User < ApplicationRecord
  has_one :otp_verification
  has_many :tickets
end
