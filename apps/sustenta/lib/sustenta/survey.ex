defmodule Sustenta.Survey do
  alias Sustenta.{Survey, Question}

  @enforce_keys [:type, :questions]
  defstruct @enforce_keys

  def new(), do:
    {:ok, %Survey{type: :test, questions: MapSet.new()}}

  def add_question(%Survey{} = survey, %Question{} = question), do:
    update_in(survey.questions, &MapSet.put(&1, question))
end
