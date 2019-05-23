defmodule Sustenta.QuestionTest do
  use Sustenta.DataCase

  alias Sustenta.{Question, TestHelper}

  @valid_question_attrs %{description: "some description"}

  test "new question with valid attrs" do
    assert {:ok, @valid_question_attrs} = TestHelper.create_question
  end

  test "add answer to new question with valid attrs" do
    {:ok, new_question} = TestHelper.create_question
    {:ok, new_answer} = TestHelper.create_answer
    new_question = Question.add_answer(new_question, new_answer)
    assert MapSet.member?(new_question.answers, new_answer)
  end

end