class WelcomeController < ApplicationController
  def index

  end

  def show
    puts "tadaa"
    redirect_to url_for(:controller => :articles, :action => :index)
  end
end
