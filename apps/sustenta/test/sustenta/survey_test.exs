defmodule Sustenta.SurveyTest do
  use Sustenta.DataCase

  alias Sustenta.{Survey, TestHelper}

  @valid_survey_attrs %{questions: MapSet.new, type: :test}

  test "new survey" do
    assert {:ok, @valid_survey_attrs} = TestHelper.create_survey
  end

  test "add answer to new question with valid attrs" do
    {:ok, new_question} = TestHelper.create_question
    {:ok, new_survey} = TestHelper.create_survey
    new_survey = Survey.add_question(new_survey, new_question)
    assert MapSet.member?(new_survey.questions, new_question)
  end
end