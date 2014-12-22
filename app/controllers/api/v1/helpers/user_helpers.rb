module API::V1::Helpers::UserHelpers
  extend Grape::API::Helpers


  params :user_params do
    
      optional :id, type: Integer
      requires :email, type: String
      optional :encrypted_password, type: String
      optional :reset_password_token, type: String
      optional :reset_password_sent_at, type: DateTime
      optional :remember_created_at, type: DateTime
      optional :sign_in_count, type: Integer
      optional :current_sign_in_at, type: DateTime
      optional :last_sign_in_at, type: DateTime
      optional :current_sign_in_ip, type: String
      optional :last_sign_in_ip, type: String
      optional :created_at, type: DateTime
      optional :updated_at, type: DateTime

  end

  def user_params
    params.require(:user).permit(
      
        :id, 
        :email, 
        :encrypted_password, 
        :reset_password_token, 
        :reset_password_sent_at, 
        :remember_created_at, 
        :sign_in_count, 
        :current_sign_in_at, 
        :last_sign_in_at, 
        :current_sign_in_ip, 
        :last_sign_in_ip, 
        :created_at, 
        :updated_at, 

    )
  end

  def logger
    Grape::API.logger
  end

end