class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_admin_email(admin)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @admin = admin 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'https://quanttine-staging.herokuapp.com/dashboard' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Bienvenue chez nous !') 
  end


end
