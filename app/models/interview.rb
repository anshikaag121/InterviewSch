class Interview < ApplicationRecord
    validate :cannot_overlap
    def cannot_overlap
            @user = Interview.where(id: self.intervieweeid)
            @user.each do |user|
                st = user.start_t
                en = user.end_t
                if [st, self.start_t].max < [en, self.end_t].min
                    errors.add(:Not_possible, "time overlap with interviewee")
                end
            end
            @user = Interview.where(id: self.interviewerid)
            @user.each do |user|
                st = user.start_t
                en = user.end_t
                if [st, self.start_t].max < [en, self.end_t].min
                    errors.add(:cannot_schedule_interview, "time oerlap with interviewer")
                end
            end
      end
end
