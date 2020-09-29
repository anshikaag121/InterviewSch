class MailJob < ApplicationJob
  queue_as :default

  def perform(interview, option)
      inter = interview.id
      puts inter
      begin
        if Interview.find(interview.id)

          if (option == 'schedule')
            UserMailer.with(user: interview.interviewerid).schedule.deliver_now
            UserMailer.with(user: interview.intervieweeid).schedule.deliver_now
          end
          if (option == 'reminder')
              if interview.start_t <=30.minutes && interview.start_t - Time.now >=25.minutes
                UserMailer.with(user: interview.interviewerid).reminder.deliver_now
                UserMailer.with(user: interview.intervieweeid).reminder.deliver_now
              end
          end
          if (option == 'update')
            UserMailer.with(user: interview.interviewerid).update.deliver_now
            UserMailer.with(user: interview.intervieweeid).reminder.deliver_now

          end
        end
            rescue => exception
      end
  end
end
