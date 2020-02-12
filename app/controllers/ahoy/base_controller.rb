module Ahoy
  class BaseController < ApplicationController
    # skip all filters except for authlogic
    filters = _process_action_callbacks.map(&:filter) - [:load_authlogic]
    skip_before_action(*filters, raise: false)
    skip_after_action(*filters, raise: false)
    skip_around_action(*filters, raise: false)

    def ahoy
      @ahoy ||= Ahoy::Tracker.new(controller: self, api: true)
    end
  end
end
