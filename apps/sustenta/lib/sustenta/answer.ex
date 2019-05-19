defmodule Sustenta.Answer do
  alias __MODULE__
  defstruct [:description, :raw_score, :type]

  def new(description, raw_score, type \\ 0), do:
    {:ok, %Answer{description: description, raw_score: raw_score, type: type}}
end