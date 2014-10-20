class UserMailer < ActionMailer::Base
  default from: "soc-cusfs-secretary@lists.cam.ac.uk"
  require 'mandrill'
  mandrill = Mandrill::API.new 'PoumGKjhVDALQx8DXRPBDQ'

  def welcome_email(user, pw)
    @user = user
    @pw = pw
    @url  = url_for :controller => 'users', :action => 'edit', :id => user.id
    @help_url = url_for :controller => 'static_pages', :action => 'help'
    mail(to: @user.email, subject: "[CUSFS] Welcome, #{user.name}!")
  end

  def please_deliver_item_email(user, item, notes)
    @librarian = User.find_by(name: "The Librarian")
    @url = url_for :controller => 'users', :action => 'reservations', :id => user.id
    @title = item.title
    @notes = notes
    @user = user
    mail(to: "sb913@cam.ac.uk", subject: "[CUSFS] LIBARY: #{user.name} wants to borrow #{@title}")
  end

  def please_return_item_email(user, item)
    @user = user
    @url  = url_for :controller => 'events', :action => 'library_openings'
    @title = item.title
    @sec_email = User.find_by(name: "The Secretary").email
    mail(to: @user.email, subject: "[CUSFS] LIBARY: #{item.title} has been requested by another user")
  end


end
