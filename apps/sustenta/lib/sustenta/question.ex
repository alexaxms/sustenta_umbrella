defmodule Sustenta.Question do
  alias Sustenta.{Question, Answer}

  @enforce_keys [:description, :answers]
  defstruct @enforce_keys

  def new(description), do:
    {:ok, %Question{description: description, answers: MapSet.new()}}

  def add_answer(%Question{} = question, %Answer{} = answer), do:
    update_in(question.answers, &MapSet.put(&1, answer))
end
