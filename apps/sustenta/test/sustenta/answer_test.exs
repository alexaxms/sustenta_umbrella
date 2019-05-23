defmodule Sustenta.AnswerTest do
  use Sustenta.DataCase

  alias Sustenta.{Answer, TestHelper}

  @valid_attrs %{description: "some description", raw_score: 1, type: 0}

  test "new answer with valid attrs" do
    assert {:ok, @valid_attrs} = TestHelper.create_answer
  end
end