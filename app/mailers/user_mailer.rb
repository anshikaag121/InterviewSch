class UserMailer < ApplicationMailer
    before_action :set_interviews, only: [:schedule, :update, :reminder]

        def welcome_email(temp)
            #@user = params[:user]
            mail(to: temp, subject: 'Welcome to My Awesome Site')
          end
      def schedule
          mail(to: @interviewee.email, subject: 'Your interview has been scheduled')
      end
      def update
          mail(to: @interviewee.email, subject: 'Your interview has been updated')
      end
      def reminder
          mail(to: @interviewee.email, subject: 'Reminder for the interview')
      end
      private
              def set_interviews
                  @user = params[:user]
                  @interviewee = Participant.find(@user.intervieweeid)
                  @interviewer = Participant.find(@user.interviewerid)
                  @url  = 'http://example.com/login'
              end
end
