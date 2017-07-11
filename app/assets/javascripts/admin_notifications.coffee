#class Admin_Notifications
#  constructor: ->
#    @admin_notifications = $("[data-behavior='notification_items']")
#    this.setup() if @admin_notifications.length > 0
#
#  setup: ->
#    console.log @admin_notifications.length
#    $.ajax(
#      url: "/admin_notifications.json"
#      dataType: "JSON"
#      method: "GET"
#      success: @handleSuccess
#    )
#  handleSuccess: (data) =>
#    items = $.map data, (notification) ->
#      "<tr>
#        <td>
#          <p>Пользователь <a href='#{notification.actor_url}'>#{notification.actor.type}</a> #{notification.action}
#          <a href='#{notification.url}'>#{notification.notifiable.type}</a>
#          </p>
#        </td>
#      </tr>"
#
#    $("[data-behavior='notification_items']").html(items)
#
jQuery ->
  
  $('.mark_as_read').add('.delete-notification').on 'ajax:success',
    -> $(@).closest('tr').fadeOut(150)
