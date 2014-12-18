class ApiGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates/api', __FILE__)


  argument       :resource_name, required: true

  class_option   :api_version, aliases: '-v', type: :string, desc: 'The version of API this endpoint is being generated for.', default: 'v1'




end
