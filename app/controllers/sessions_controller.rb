class SessionsController < ApplicationController
  def hi
  end

  def new
    redirect_to Octokit.authorize_url
  end

  def callback
    @access_token = Octokit.exchange_code_for_token(params[:code]).access_token

    begin
      Octokit.check_application_authorization(@access_token)
      session[:access_token] = @access_token

      redirect_to '/'
    rescue => e
      redirect_to '/welp'
    end
  end

  def destroy
    session.delete(:access_token)
    redirect_to root_path
  end
end
