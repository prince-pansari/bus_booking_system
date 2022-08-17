class Api::UserController < ApplicationController


    api :POST, 'api/user/login'
    param :phone, String, required: true
    param :name, String, required: true

    def login
        if validatephone params[:phone] 
            logger.debug 'true'
        else
            logger.debug 'false'
        end
        render json: {msg: params[:phone]}, status: :ok
    end


    def validatephone(phone)
        return if phone.match('/^(\+\d{1,3}[- ]?)?\d{10}$/')
    end
end
