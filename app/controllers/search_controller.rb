class SearchController < ApplicationController
  protect_from_forgery with: :null_session

  def complete
    @filenames = Filename
    .where('name ILIKE ?', "%#{params[:partial]}%")
    .distinct
    .limit(50)

    @suggestions = @filenames.map do |n|
      {
        text: n.name,
        url: share_path(n.shares.first),
      }
    end

    render json: @suggestions
  end
end
