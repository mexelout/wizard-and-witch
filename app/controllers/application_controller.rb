class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :before

  # check sign in
  def before
    logger.info "sign_in_? #{user_signed_in?}"

    if current_user
      current_user.tap do |u|
        puts "id: #{u.id}"
        puts "email: #{u.email}"
        puts "encrypted_password: #{u.encrypted_password}"
        puts "reset_password_token: #{u.reset_password_token}"
        puts "reset_password_cent_at: #{u.reset_password_sent_at}"
        puts "remember_created_at: #{u.remember_created_at}"
        puts "sign_in_count: #{u.sign_in_count}"
        puts "current_sign_in_at: #{u.current_sign_in_at}"
        puts "last_sign_in_at: #{u.last_sign_in_at}"
        puts "current_sign_in_ip: #{u.current_sign_in_ip}"
        puts "last_sign_inip: #{u.last_sign_in_ip}"
        puts "name: #{u.name}"
        puts "progress: #{u.progress}"
        puts "created_at: #{u.created_at}"
        puts "updated_at: #{u.updated_at}"
      end
    end
  end

end
