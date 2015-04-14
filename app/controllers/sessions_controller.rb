class SessionsController < ApplicationController
  def new
    redirect_to Octokit.authorize_url, :status => 307
  end

  def create
    session[:access_token] = Octokit.exchange_code_for_token(params[:code]).access_token
    redirect_to logged_in_root_path
  end

  def destroy
    session.delete(:access_token)
    redirect_to root_path
  end
end
