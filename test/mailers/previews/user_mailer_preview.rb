# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

    def event_participant_email
        UserMailer.event_participant_email
    end
    

end
