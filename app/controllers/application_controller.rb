class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  Refile.secret_key = 'abf37b79024c13ba80364d19dfa2e153b75e4da91d129cc7bf0e0e35fa481eba495d3dd9aad7d4d6aed79c2db88c10d049fee41437f09a6a43c00bd4d62fd4aa'

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
