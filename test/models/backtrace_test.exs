defmodule ErrbitElixir.BacktraceTest do
  use ErrbitElixir.ModelCase

  alias ErrbitElixir.Backtrace

  @valid_attrs %{lines: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Backtrace.changeset(%Backtrace{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Backtrace.changeset(%Backtrace{}, @invalid_attrs)
    refute changeset.valid?
  end
end
