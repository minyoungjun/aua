class SurveyController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def profile

    @survey = Survey.find(params[:id])

  end

  def profile_process

    user = User.new
    user.survey_id = params[:id]
    user.realname = params[:realname]
    user.department = params[:department]
    user.phone = params[:phone1] + "-" + params[:phone2] + "-" + params[:phone3]
    user.save
    session[:user] = user.id

    redirect_to :action => "view",
                :id => user.survey_id

  end

  def view

    @survey = Survey.find(params[:id])

  end
  def submit_process
  
    survey = Survey.find(params[:id])
    survey.paragraphs.each do |paragraph|
      paragraph.boxes.each do |box|
        if box.content_type == 2
          long = Longanswer.new
          long.box_id = box.id
          long.content = params["box_answer_" + box.id.to_s]
          long.save
        else
          if box.content_type == 1 || box.content_type == 5
            if params["box_" + box.id.to_s] != nil
              answer = Answer.new
              answer.example_id = params["box_" + box.id.to_s]
              answer.user_id = session[:user]
              exam = Example.where(:id => params["box_" + box.id.to_s].to_i)
                if exam.count != 0 && exam.first.example_type == 2
                  answer.etc_answer = params["etc_" + exam.first.id.to_s]
                end
              answer.save
            end
          else
            box.examples.each do |example|
              if params["example_"+ example.id.to_s].to_i == example.id
                answer = Answer.new
                answer.example_id = example.id
                answer.user_id = session[:user]
                if example.example_type == 2
                  answer.etc_answer = params["etc_" + example.id.to_s]
                end
                answer.save
              end
            end
          end
        end
      end
    end

    redirect_to :action => "complete",
                :id => survey.id
  end

  def complete

  @survey = Survey.find(params[:id])


  end

end
