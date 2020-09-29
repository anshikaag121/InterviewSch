class InterviewsController < ApplicationController
    skip_before_action  :verify_authenticity_token
    before_action :set_participant, only: [:show, :edit, :update, :destroy]
    before_action :set_participants, only: [:new, :create, :edit, :update]
    def index
        @interview = Interview.all
    end
    def show
        # render json: @interview
    end
    def new
        @interview = Interview.new
    end
    def create
        @interview = Interview.new(interview_params)
        if @interview.save
            @name = Participant.find(@interview.intervieweeid).email
            puts @name
            #UserMailer.with(user: @interview).schedule.deliver_now
            MailJob.perform_later(@interview, "schedule")
            scheduledtime = @interview.start_t - 5.hours - 30.minutes - 30.minutes
            #UserMailer.with(user: @interview).reminder.deliver_later(wait_until: scheduledtime)
            MailJob.set(wait_until: scheduledtime).perform_later(@interview, "reminder")
            redirect_to interview_path(@interview)
        else
        render 'new'
        end
    end
    def edit
    end

    def update
        if @interview.update(interview_params)
            UserMailer.with(user: @interview).update.deliver_now
            MailJob.perform_later(@interview, "update")
            scheduledtime = @interview.start_t - 5.hours - 30.minutes - 30.minutes
            MailJob.perform_later(@interview, "reminder")
            redirect_to interview_path(@interview)
        else
        render 'edit'
        end
    end
    def destroy
        if @interview.present?
            @interview.destroy
        end
        redirect_to interviews_path
    end
    private
        def interview_params
            params.require(:interview).permit(:intervieweeid, :interviewerid, :start_t, :end_t)
        end
        def set_participant
            @interview = Interview.find(params[:id])
        end
        def set_participants
            @participant1 = Participant.where(ptype: 'Interviewee')
            @participant2 = Participant.where(ptype: 'Interviewer')
        end
end