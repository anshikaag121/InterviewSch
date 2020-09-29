class Func
    def check(params)
        if params[:participant][:type] == 'Interviewee' && params[:participant][:resume] == nil
            return false
        else
            return true
        end
    end
end