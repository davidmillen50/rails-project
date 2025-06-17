class GrammarRulesController < ApplicationController
  def index
    grammar_rules = GrammarRule.all
    render json: grammar_rules
  end

  def show
    grammar_rules = GrammarRule.find(params[:id])
    render json: grammar_rules
  end

  def create
    grammar_rules = GrammarRule.new(post_params)
    if grammar_rules.save
      render json: grammar_rules, status: :created
    else
      render json: grammar_rules.errors, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:grammar_rule).permit(:title, :description, :subject_id)
    end
end
