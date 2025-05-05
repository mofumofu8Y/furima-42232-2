class ApplicationController < ActionController::Base

  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'yamamo2020y@gmail.com' && password == 'pamyupamyu8Y'
    end
  end
end


