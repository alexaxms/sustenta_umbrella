defmodule Sustenta.TestHelper do
  alias Sustenta.{Survey, Question, Answer}

  @valid_answer_attrs %{description: "some description", raw_score: 1, type: 0}
  @valid_question_attrs %{description: "some description"}

  def create_answer do
    Answer.new(@valid_answer_attrs.description, @valid_answer_attrs.raw_score, @valid_answer_attrs.type)
  end

  def create_question do
    Question.new(@valid_question_attrs.description)
  end

  def create_survey do
    Survey.new
  end
end