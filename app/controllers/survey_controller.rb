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
          if box.content_type == 1|| box.content_type == 5
            answer = Answer.new
            answer.example_id = params["box_" + box.id.to_s]
              if Example.find(params["box_" + box.id.to_s].to_i).example_type == 2
                answer.etc_answer = params["etc_" + example.id.to_s]
              end
            answer.save
          else

            box.examples.each do |example|
              if params["example_"+ example.id.to_s].to_i == example.id
                answer = Answer.new
                answer.example_id = example.id
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

    redirect_to :action => "complete"

  end

end
