defmodule Destino.Controllers.Main do
  use Sugar.Controller

  def index(conn, args) do
    if length(args) == 0 do
      render conn
    else
      redirect conn, gem_page(args[:gem])
    end
  end

  # Returns github page url or rubygems gem page url
  defp gem_page(gem) do
    api_url = "https://rubygems.org/api/v1/gems/#{gem}.json"
    response = HTTPoison.get! api_url

    if response.status_code == 404 do
      # redirect to rubygems 404 page
      "https://rubygems.org/gems/#{gem}"
    else
      json = JSX.decode! response.body
      repo = get_repo_name(json["homepage_uri"]) || get_repo_name(json["source_code_uri"])

      if repo && github_exists?(repo) do
        "https://github.com/#{repo}"
      else
        json["project_uri"]
      end
    end
  end

  # Extracts full repo name from github url
  defp get_repo_name(url) do
    unless is_nil(url) do
      Regex.scan(~r/\Ahttps?:\/\/github.com\/(.+\/.+)/, url)
      |> List.flatten
      |> List.last
    end
  end

  defp github_exists?(repo) do
    HTTPoison.start
    case HTTPoison.head("https://github.com/#{repo}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: _}} ->
        true
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        false
      {:error, %HTTPoison.Error{reason: _}} ->
        false
    end
  end
end
