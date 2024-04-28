# frozen_string_literal: true

module Shared
  class RootLink < ViewComponent::Base
    include Singleton

    erb_template <<-ERB
      <p>
        <%= link_to "Home", root_path %>
      </p>
    ERB
  end
end
