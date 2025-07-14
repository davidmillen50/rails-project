class GrammarRulesController < ApplicationController
  def index
    grammar_rules = GrammarRule.all
    render json: grammar_rules
  end

  def show
    grammar_rule = GrammarRule.find(params[:id])
    render json: grammar_rule
  end

  def create
    grammar_rule = GrammarRule.new(post_params)
    if grammar_rule.save
      render json: grammar_rule, status: :created
    else
      render json: grammar_rule.errors, status: :unprocessable_entity
    end
  end

  def update
    grammar_rule = GrammarRule.find(params[:id])
    if grammar_rule.update(post_params)
      render json: grammar_rule
    else
      render json: grammar_rule.errors, status: :unprocessable_entity
    end
  end

  def destroy
    grammar_rule = GrammarRule.find(params[:id])
    if grammar_rule.destroy
      head :no_content
    else
      render json: grammar_rule.errors, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:grammar_rule).permit(:title, :description, :subject_id)
    end
end
