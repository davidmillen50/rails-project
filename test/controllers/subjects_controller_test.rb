require "test_helper"

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:nouns)
  end

  test "should get index" do
    get subjects_url, as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_kind_of Array, body
    assert_equal @subject.title, body.first["title"]
  end

  test "should show lesson" do
    get subject_url(@subject), as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @subject.title, body["title"]
    assert_equal @subject.description, body["description"]
  end

  test "should create subject" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { title: "New Subject", description: "New description" } }, as: :json
    end
    assert_response :created
    body = JSON.parse(response.body)
    assert_equal "New Subject", body["title"]
  end

  test "should not create subject with invalid params" do
    assert_no_difference("Subject.count") do
      post subjects_url, params: { subject: { title: "" } }, as: :json
    end
    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert body.present?
  end

  test "should update subject" do
    patch subject_url(@subject),
      params: {
        subject: {
          title: "Updated Title",
          description: "Updated description"
        }
      },
      as: :json
    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "Updated Title", body["title"]
    assert_equal "Updated description", body["description"]
  end

  test "should not update subject with invalid params" do
    patch subject_url(@subject),
      params: {
        subject: {
          title: ""
        }
      },
      as: :json
    assert_response :unprocessable_entity
    body = JSON.parse(response.body)
    assert body.present?
  end

  test "should destroy subject" do
    assert_difference("Subject.count", -1) do
      delete subject_url(@subject), as: :json
    end
    assert_response :no_content
  end
end
