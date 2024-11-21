# frozen_string_literal: true

require "notiffany/notifier/base"
module Notiffany
  class Notifier

    class Instrumentation < Base
      DEFAULTS = {}

      private

      def _check_available(opts = {}) end

      def _perform_notify(message, opts = {})
        ActiveSupport::Notifications.instrument 'guard.instrumentation', { message: message }.merge({ options: opts })
      end

      def _gem_name
        "active_support"
      end
    end
  end
end
