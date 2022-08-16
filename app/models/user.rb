class User < ApplicationRecord
  has_one :otp_verification
end
