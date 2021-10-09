module RepositoriesHelper
  def paginated_link_url(github_link)
    github_link ? "/repositories?#{URI.parse(github_link).query}" : github_link
  end
end
