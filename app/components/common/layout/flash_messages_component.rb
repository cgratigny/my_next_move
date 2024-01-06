# frozen_string_literal: true

class Common::Layout::FlashMessagesComponent < ApplicationComponent
  def render?
    flash_messages.any?
  end

  def flash_messages
    _flash_messages = []

    if alert.present?
      _flash_messages << {message: alert, classes: alert_classes}
    end

    if notice.present?
      _flash_messages << {message: notice, classes: notice_classes}
    end
    _flash_messages
  end

  def notice
    helpers.notice
  end

  def alert
    helpers.alert
  end

  def alert_classes
    "bg-red-100 text-red-900 dark:bg-red-900 dark:text-red-400"
  end

  def notice_classes
    "bg-slate-100 text-slate-900 dark:bg-slate-900 dark:text-slate-400"
  end
end
