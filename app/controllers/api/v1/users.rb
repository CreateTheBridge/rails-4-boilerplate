class API::V1::Users < Grape::API
  content_type :json, 'application/json'
  version 'v1'
  format :json
  logger Lumberjack::Logger.new('logs/api/v1/users.log')
  helpers API::V1::Helpers::UserHelpers

  resource :users do
    # GET: /users
    get do
      begin
        User.all
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end

    end

    # GET: /users/:id
    get ':id', requirements: { id: /[0-9]*/ } do
      begin
        User.find params[:id]
      rescue ActiveRecord::RecordNotFound => e
        logger.error e
        error! 'Resource not found', 404
      end
    end

    # POST /users
    params do
      use :user_params
    end
    post do
      begin
        User.create!(user_params)
      rescue ActiveRecord::RecordInvalid => e
        logger.error e
        error! e, 400
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end
    end

    # PUT /users/:id
    params do
      use :user_params
    end
    put ':id', requirements: { id: /[0-9]*/ } do
      begin
        @user = User.find params[:id]
        @user.update(user_params)
      rescue ActiveRecord::RecordNotFound => e
        logger.error e
        error! 'Resource not found', 404
      rescue ActiveRecord::RecordInvalid => e
        logger.error e
        error! e, 400
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end
    end

    # DELETE /users:id
    delete ':id', requirements: { id: /[0-9]*/ } do
      begin
        @user = User.find params[:id]
        @user.destroy!
      rescue ActiveRecord::RecordNotFound => e
        logger.error e
        error! 'Resource not found', 404
      rescue ActiveRecord::RecordNotDestroyed => e
        logger.error e
        error! "Failed to destroy record: #{e.to_s}", 400
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end
    end
  end

end