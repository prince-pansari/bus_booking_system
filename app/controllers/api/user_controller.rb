class Api::UserController < ApplicationController


    api :POST, 'api/user/login'
    param :number, /\A\d{10}\z/, required: true
    param :name, String, required: false
    def login
        user = User.find_by(number: params[:number])
        if user.nil?
            user = User.create({number: params[:number],
                               name: params[:name]})
        end
        otp = six_digit_rand
        row = OtpVerification.find_by(user_id: user.id)
        if row.nil?
            OtpVerification.create({user_id: user.id, otp: otp})
        else
            row.otp = otp
            row.save
        end

        response = HTTParty.post("https://www.fast2sms.com/dev/bulkV2",
                                 :body => {variables_values: otp, route: 'otp', numbers: params[:number].to_i},
                                 :headers => {authorization: 'U6WAcLYpfJwou58SqmiX4MyHgFQxEl7GnjKN01dkrtIsVaCR9vuv7thRdSjk83wEPAoT29gpIW41r5GM'}
        )
        if response.body['return']
            render json: {user_id: user.id}, status: :ok
        else
            render json: {error: 'Error!!'}, status: :unprocessable_entity
        end
    end

    api :POST, 'api/user/verify_otp'
    param :user_id, Integer, required: true
    param :otp, Integer, required: true
    def verify_otp
        row = OtpVerification.find_by(user_id: params[:user_id], otp: params[:otp])
        if row.nil?
            render json: {error: 'Incorrect OTP'}, status: :unprocessable_entity
            return
        end
        token = generate_token
        user = User.find(params[:user_id])
        user.verified = true
        user.token = token
        user.save
        render json: {token: token}, status: :ok
    end

    def six_digit_rand
        (SecureRandom.random_number(9000) + 1000).to_i
    end

    def generate_token
        loop do
            token = SecureRandom.hex(16)
            break token unless User.where(token: token).exists?
        end
    end
end
