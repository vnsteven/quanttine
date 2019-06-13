class AdminMailer < ApplicationMailer

  def welcome_email(admin)
    @admin = admin
    @url  = 'https://quanttine.herokuapp.com'
    mail(to: @admin.email, subject: "L'équipe de Quanttine vous souhaite la bienvenue.")
  end

  def subscription_email(admin)
    @admin = admin
    mail(to: @admin.email, subject: "Récapitulatif de votre abonnement Quanttine")
  end

  def unsubscription_email(admin)
    @admin = admin
    mail(to: @admin.email, subject: "L'équipe de Quanttine regrette de vous voir partir.")
  end

end
