#coding:utf-8

class AdminController < ApplicationController

  def index
    @surveys = Survey.all
  end

  def result
    @survey = Survey.find(params[:id])

  end


  def new_survey


  end


  def new_process
    survey = Survey.new
    survey.title = params[:title]
    survey.content = params[:content]
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
