# frozen_string_literal: true

module Rails
  module Rack
    class Logger < ActiveSupport::LogSubscriber
      def started_request_message(request)
        message = "::[Started #{request.request_method} #{request.filtered_path}"
        message += " for #{request.ip} at #{Time.zone.now.to_default_s}"
        message += " by #{users_browser(request.env['HTTP_USER_AGENT'].downcase)}]"
        message += "- Level:[#{Rails.logger.level}]"
        message
      end

      def users_browser(user_agent)
        if user_agent.index('msie') && !user_agent.index('opera') && !user_agent.index('webtv')
          'IE' + user_agent[user_agent.index('msie') + 5].chr
        elsif user_agent.index('opera')
          'Opera'
        elsif user_agent.index('konqueror')
          'Konqueror'
        elsif user_agent.index('ipod')
          'Ipod'
        elsif user_agent.index('ipad')
          'Ipad'
        elsif user_agent.index('iphone')
          'Iphone'
        elsif user_agent.index('chrome/')
          'Chrome'
        elsif user_agent.index('applewebkit/')
          'Safari'
        elsif user_agent.index('googlebot/')
          'Googlebot'
        elsif user_agent.index('msnbot')
          'MSNbot'
        elsif user_agent.index('yahoo! slurp')
          'Yahoobot'
        elsif user_agent.index('mozilla/') || user_agent.index('gecko/')
          'Mozilla'
        else
          'Unknown'
        end
      end
    end
  end
end
