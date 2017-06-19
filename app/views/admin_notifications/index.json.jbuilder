json.array! @admin_notifications do |admin_notification|
  json.id admin_notification.id
  json.recipient admin_notification.recipient
  json.actor do
    json.type "#{admin_notification.actor.first_name}" + " " + "#{admin_notification.actor.last_name}"
  end
  json.action admin_notification.action
  json.notifiable do #admin_notification.notifiable
    json.type "новую Схему"
  end
  json.url pattern_path(admin_notification.notifiable, anchor: dom_id(admin_notification.notifiable)) #review in case of url issues in JS
end
