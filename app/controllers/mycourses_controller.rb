class MycoursesController < ApplicationController
  def destroy
    @mycourse = Mycourse.find(params[:id])
    
    redirect_to mycourses_path
    @mycourse.destroy
  end
  def update
    @mycourse = Mycourse.find(params[:id])
    if @mycourse.update(mycourse_params)
      redirect_to mycourses_path
    else
      render :edit
    end
  end
  def edit
    @mycourse = Mycourse.find(params[:id])
  end
  def show
    @mycourse = Mycourse.find(params[:id])
  end
  def index
    @mycourses = Mycourse.all
    if params[:name].present?
      @mycourses = @mycourses.where("name like ?", "%#{params[:name]}%")
    end
    if params[:teacher].present?
      @mycourses = @mycourses.where("teacher like ?", "%#{params[:teacher]}%")
    end
    if params[:time].present?
      @mycourses = @mycourses.where("time like ?", "%#{params[:time]}%")
    end
  end
  def new
    @mycourse = Mycourse.new
  end
  def create
    @mycourse = Mycourse.new(mycourse_params)
    if @mycourse.save
      redirect_to mycourses_path
    else
      render :new
    end
  end
  
  private
  
  def mycourse_params
    params.require(:mycourse).permit(:name,:teacher,:location,:time,:credit)
  end
end
