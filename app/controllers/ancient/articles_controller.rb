class Ancient::ArticlesController <  BaseController

  def index
    @q = Article.ransack(params[:q])
    @articles =  @q.result.page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

end
