module ApplicationHelper
  def client
    @client ||= Octokit::Client.new(:access_token => session[:access_token])
  end

  # def authenticated?
  #   begin
  #     Octokit.check_application_authorization(session[:access_token])
  #   rescue => e
  #     false
  #   end
  # end

  def authenticated?
    !!session[:access_token]
  end
end
