class RegistrationsController < Devise::RegistrationsController

def create
  super

  @admins = User.where(admin: true)
  @admins.each do |f|
    AdminNotification.create(recipient: f, actor: current_user, action: "создал(а)", notifiable: @user)
  end
end

end
