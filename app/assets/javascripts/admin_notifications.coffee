class Admin_Notifications
  constructor: ->
    @admin_notifications = $("[data-behavior='admin_notifications']")
    this.setup() if @admin_notifications.length > 0

  setup: ->
    $.ajax(
      url: "/admin_notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  handleSuccess: (data) =>
    console.log(data)
    items = $.map data, (notification) ->
      "<td><a href='#{notification.url}'>#{notification.actor.type} #{notification.action} #{notification.notifiable.type}</a></td>"

    $("[data-behavior='notification_items']").html(items)

jQuery ->
  new Admin_Notifications
