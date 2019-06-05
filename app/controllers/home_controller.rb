class HomeController < ApplicationController
  def index
    response = RestClient.get("http://localhost:3000/tasks/?token=#{session[:token]}")

    @teste = JSON.parse(response.body)

      if @teste["errors"]
        redirect_to "http://localhost:3002/users/auth/gett"
      end
  end
end
