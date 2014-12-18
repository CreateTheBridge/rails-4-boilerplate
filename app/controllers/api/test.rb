=begin
module API
  module V1
    class ClassName < Grape::API

      version "#{api_version.downcase}"
      format api_format.downcase.to_sym
      # TODO: Add Helpers Templates


      resource resource_name.downcase.pluralize.to_sym do

        # GET /resource_name
        get do
          resource.all
        end

        # GET /resource_name/:id
        get ':id' do
          begin
            resource.find params[:id]
          rescue ActiveRecord::RecordNotFound
            error! 'Resource not found', 404
          end
        end

      end

    end
  end
end=end
