defmodule ErrbitElixir.AppTest do
  use ErrbitElixir.ModelCase

  alias ErrbitElixir.App

  @valid_attrs %{api_key: "some api_key", asset_host: "some asset_host", bitbucket_repo: "some bitbucket_repo", current_app_version: "some current_app_version", email_at_notices: "some email_at_notices", github_repo: "some github_repo", name: "some name", notify_all_users: true, notify_on_errs: true, repository_branch: "some repository_branch"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = App.changeset(%App{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = App.changeset(%App{}, @invalid_attrs)
    refute changeset.valid?
  end
end
