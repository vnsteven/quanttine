class AdminMailer < ApplicationMailer

  def welcome_email(admin)
    @admin = admin
    @url  = 'https://quanttine.herokuapp.com'
    mail(to: @admin.email, subject: "L'équipe de Quanttine vous souhaite la bienvenue.")
  end
  
end
