class SurveyController < ApplicationController

  def index
    @surveys = Survey.all
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
          box.examples.each do |example|
            if params["example_"+box.id.to_s].to_i == example.id
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

    redirect_to :action => "complete"

  end

end
