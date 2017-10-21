defmodule ErrbitElixir.ErrTest do
  use ErrbitElixir.ModelCase

  alias ErrbitElixir.Err

  @valid_attrs %{last_notice_at: ~N[2010-04-17 14:00:00.000000], resolved: true, resolved_at: ~N[2010-04-17 14:00:00.000000]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Err.changeset(%Err{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Err.changeset(%Err{}, @invalid_attrs)
    refute changeset.valid?
  end
end
