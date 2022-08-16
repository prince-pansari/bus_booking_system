class CreateOtpVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :otp_verifications do |t|
      t.integer :user_id, index: true
      t.integer :otp, null: false

      t.timestamps
    end
  end
end
