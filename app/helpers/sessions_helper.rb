module SessionsHelper
  def client
    @client ||= Octokit::Client.new(:access_token => session[:access_token])
  end
end
