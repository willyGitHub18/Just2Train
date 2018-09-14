class UserMailer < ApplicationMailer

    def welcome_email(user)
       mail(to: user, subject: "Welcome On Board!")
    end

    def event_participant_email(user)
        mail(to: user, subject: "Confirmation of your participation to an Event!")
    end

end


