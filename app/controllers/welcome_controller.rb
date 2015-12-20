class WelcomeController < ApplicationController
  def index

  end

  def show
    puts "tadaa"
    redirect_to url_for(:controller => :articles, :action => :index)
  end

  def show_all_posts
    articles_controller = ArticlesController.new
    articles_controller.request = request
    articles_controller.response = response
    articles_controller.index
  end

  def blog_path
    binding.pry
    puts "tadaa"
    redirect_to url_for(:controller => :articles, :action => :index)
  end
end
