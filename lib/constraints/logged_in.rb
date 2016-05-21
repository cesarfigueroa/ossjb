module Constraints
  class LoggedIn
    def self.matches?(request)
      begin
        Octokit.check_application_authorization(request.session[:access_token])
      rescue => e
        false
      end
    end
  end
end
