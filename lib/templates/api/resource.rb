class <%= namespace %> < Grape::API
  <%= content_type %>
  version '<%= version.downcase %>'
  format :json
  logger Lumberjack::Logger.new('logs/api/<%= version.downcase %>/<%= resource.underscore %>.log')
  helpers <%= helpers_namespace %>

  resource :<%= resource.underscore %> do
    # GET: /<%= resource.underscore %>
    get do
      begin
        <%= type_name %>.all
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end

    end

    # GET: /<%= resource.underscore %>/:id
    get ':id', requirements: { id: /[0-9]*/ } do
      begin
        <%= type_name %>.find params[:id]
      rescue ActiveRecord::RecordNotFound => e
        logger.error e
        error! 'Resource not found', 404
      end
    end

    # POST /<%= resource.underscore %>
    params do
      use :<%= resource_name.underscore %>_params
    end
    post do
      begin
        <%= type_name %>.create!(<%= resource_name.underscore %>_params)
      rescue ActiveRecord::RecordInvalid => e
        logger.error e
        error! e, 400
      rescue => e
        logger.error e
        error! 'An unexpected server error has occurred', 500
      end
    end

    # PUT /<%= resource.underscore %>/:id
    params do
      use :<%= resource_name.underscore %>_params
    end
    put ':id', requirements: { id: /[0-9]*/ } do
      begin
        @<%= resource_name.underscore %> = <%= type_name %>.find params[:id]
        @<%= resource_name.underscore %>.update(<%= resource_name.underscore %>_params)
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

    # DELETE /<%= resource.underscore %>:id
    delete ':id', requirements: { id: /[0-9]*/ } do
      begin
        @<%= resource_name.underscore %> = <%= type_name %>.find params[:id]
        @<%= resource_name.underscore %>.destroy!
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