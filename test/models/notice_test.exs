defmodule ErrbitElixir.NoticeTest do
  use ErrbitElixir.ModelCase

  alias ErrbitElixir.Notice

  @valid_attrs %{error_class: "some error_class", framework: "some framework", message: "some message", notifier: %{}, request: %{}, server_environment: %{}, user_attributes: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Notice.changeset(%Notice{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Notice.changeset(%Notice{}, @invalid_attrs)
    refute changeset.valid?
  end
end
