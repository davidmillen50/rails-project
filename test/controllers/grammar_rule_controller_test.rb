require "test_helper"

class GrammarRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grammar_rule = GrammarRule.create!(title: "Present Simple", description: "Used for habitual actions.", subject: Subject.find_by(title: "Grammar"))
  end

  test "should get index" do
    get grammar_rules_url, as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_kind_of Array, body
    assert_equal @grammar_rule.title, body.first["title"]
  end

  test "should show grammar_rule" do
    get grammar_rule_url(@grammar_rule), as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @grammar_rule.title, body["title"]
  end

  test "should create grammar_rule" do
    subject = Subject.find_by(title: "Grammar")
    assert_difference("GrammarRule.count") do
      post grammar_rules_url, params: { grammar_rule: { title: "Past Simple", description: "Used for past actions.", subject_id: subject.id } }, as: :json
    end
    assert_response :created
    body = JSON.parse(response.body)
    assert_equal "Past Simple", body["title"]
  end

  test "should not create invalid grammar_rule" do
    subject = Subject.find_by(title: "Grammar")
    assert_no_difference("GrammarRule.count") do
      post grammar_rules_url, params: { grammar_rule: { title: "", subject_id: subject.id } }, as: :json
    end
    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert body.present?
  end
end
