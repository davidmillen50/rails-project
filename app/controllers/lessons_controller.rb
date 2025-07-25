class LessonsController < ApplicationController
  def index
    lessons = Lesson.all
    render json: lessons
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson
  end

  def create
    lesson = Lesson.new(post_params)
    if lesson.save
      render json: lesson, status: :created
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  def update
    lesson = Lesson.find(params[:id])
    if lesson.update(post_params)
      render json: lesson
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    if lesson.destroy
      head :no_content
    else
      render json: lesson.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:lesson).permit(:title, :body, :subject_id)
  end
end
