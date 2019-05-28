class HomeController < ApplicationController
  def index
    response = RestClient.get("http://localhost:3000/tasks/?token=#{session[:token]}")

    @teste = JSON.parse(response.body)

    if @teste["errors"]
      redirect_to destroy_user_session_path
    end
  end
end
