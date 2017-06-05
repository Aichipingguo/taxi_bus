class Ancient::ArticlesController <  Ancient::BaseController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

end
