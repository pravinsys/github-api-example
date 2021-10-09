class RepositoriesController < ApplicationController

  def index
    begin
      github = Github.new
      @response = parsed_params.to_h[:q].present? ? github.search.repositories(parsed_params.to_h) : nil
    rescue Github::Error::GithubError => e
      # if e.is_a? Github::Error::ServiceError
      #   # handle GitHub service errors such as 404
      # elsif e.is_a? Github::Error::ClientError
      #   # handle client errors e.i. missing required parameter in request
      # end

      Rails.logger.error e.message
      @response = nil
      flash[:error] = "Unable to fetch repositories"
    end
  end

  private

  def parsed_params
    params[:page] ||= 1
    params[:per_page] ||= 10
    # params can be extended further with :sort and :order
    # Ref: https://docs.github.com/en/rest/reference/search#search-repositories
    params.permit(:q, :page, :per_page)
  end
end
