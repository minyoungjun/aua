#coding:utf-8

class AdminController < ApplicationController
  before_filter :is_admin, :except => [:login, :login_process]
  def delete_box
    box = Box.find(params[:id])
    box.delete
    redirect_to :back

  end
  def index
    @surveys = Survey.all
  end

  def login

  end


  def login_process

    if params[:idid] == "admin" && params[:password] == "moon1009"
      session[:admin] = "admin"
      redirect_to :action => "index"
    else
      redirect_to :back
    end

  end

  def logout

    reset_session
    redirect_to :action => "login"

  end

  def content_up

    survey = Survey.find(params[:id])
    survey.term = params[:term]
    survey.content = params[:content]
    survey.save

    redirect_to :back

  end

  def result
    @survey = Survey.find(params[:id])

  end

  def destroy_survey
    survey = Survey.find(params[:id])
    survey.destroy
    redirect_to :action => "index"

  end

  def new_survey


  end


  def new_process
    survey = Survey.new
    survey.title = params[:title]
    survey.content = params[:content]
    survey.term = params[:term]
    survey.save
    redirect_to :action => "edit_survey",
                :id => survey.id
  end

  def image_change

    box = Box.find(params[:id])
    box.image_path = SecureRandom.hex(5) + params[:file].original_filename
    box.save

    f = File.open(Rails.root.join("public", "images", box.image_path),"wb")
    f.write(params[:file].read)
    f.close

    redirect_to :back

  end


  def edit_box
    box = Box.find(params[:id])
    box.question = params[:question]
    box.save
    redirect_to :back

  end
  def edit_example
    example = Example.find(params[:id])
    example.content = params[:content]
    example.save
    redirect_to :back

  end

  def delete_example

    example = Example.find(params[:id])
    example.delete
    redirect_to :back

  end

  def add_example
    example = Example.new
    example.box_id = params[:id]
    example.example_type = params[:example_type].to_i

    if params[:example_type].to_i == 2
      example.content = "기타"
    end

    example.save
    redirect_to :back

  end


  def add_box
    box = Box.new
    box.paragraph_id = params[:id]
    box.content_type = params[:box_type].to_i
    box.save

    if box.content_type == 5
      answer_array = ["전혀 그렇지 않다", "그렇지 않다", "보통이다", "그렇다", "매우 그렇다"]
      answer_array.each do |answer|
        example = Example.new
        example.box_id = box.id
        example.example_type = 1
        example.content = answer
        example.save

      end

    end

    redirect_to :back

  end

  def add_paragraph
    paragraph = Paragraph.new
    paragraph.title = params[:title]
    paragraph.survey_id = params[:id]
    paragraph.save
    
    redirect_to :back

  end

  def edit_survey

    @survey = Survey.find(params[:id])

  end

end
