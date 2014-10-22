class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :set_access_control_headers

    def set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Request-Method'] = '*'
    end
    
      after_filter :set_csrf_cookie_for_ng

      protected
      def set_csrf_cookie_for_ng
        cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
      end

      protected
      def verified_request?
        super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
      end

end
