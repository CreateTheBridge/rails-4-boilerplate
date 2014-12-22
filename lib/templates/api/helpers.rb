module <%= helpers_namespace %>
  extend Grape::API::Helpers


  params :<%= resource_name.underscore %>_params do
    <% attributes.each do |attr| %>
      <% if attribute_required? attr.to_sym %>requires :<%= attr %>, type: <%= attribute_type(attr) %><% else %>optional :<%= attr %>, type: <%= attribute_type(attr) %><% end %><% end %>

  end

  def <%= resource_name.underscore %>_params
    params.require(:<%= resource_name.underscore %>).permit(
      <% attributes.each do |e| %>
        :<%= e %>, <% end %>

    )
  end

  def logger
    Grape::API.logger
  end

end