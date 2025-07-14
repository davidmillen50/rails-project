class SubjectsController < ApplicationController
  def index
    subjects = Subject.all
    render json: subjects
  end

  def show
    subject = Subject.find(params[:id])
    render json: subject
  end

  def create
    subject = Subject.new(post_params)
    if subject.save
      render json: subject, status: :created
    else
      render json: subject.errors, status: :unprocessable_entity
    end
  end

  def update
    subject = Subject.find(params[:id])
    if subject.update(post_params)
      render json: subject
    else
      render json: subject.errors, status: :unprocessable_entity
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    if subject.destroy
      head :no_content
    else
      render json: subject.errors, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:subject).permit(:title, :description)
    end
end
