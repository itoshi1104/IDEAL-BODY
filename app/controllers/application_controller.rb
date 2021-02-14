class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    # @search = Article.search(params[:q])
    @search = Article.ransack(params[:q]) # ransackメソッド推奨
    @search_articles = @search.result(distinct: true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name sex])
  end
end
