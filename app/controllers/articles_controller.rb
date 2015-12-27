class ArticlesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  load_and_authorize_resource

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation, roles: [] ) }
  end


  #<!--  <td><%= article.user.name %></td>
  #    <% if current_user.id == article.user.id %>
  #    <td>
  #<%= link_to 'Edit', edit_article_path(article) %>
  #    </td>
  #    <td>
  #      <%= link_to 'Destroy', article_path(article),
  #                  method: :delete,
  #                  data: { confirm: 'Are you sure?' } %>
  #                  </td>
  #    <% end %> -->


  # <% if user_signed_in? %>
  # Logged in as <strong><%= current_user.email %></strong>.
  # <%= link_to 'Edit profile', edit_user_registration_path %> |
  # <%= link_to "Logout", destroy_user_session_path, method: :delete  %> |
  #  <% else %>
  # <%= link_to "Sign up", new_user_registration_path  %> |
  # <%= link_to "Login", new_user_session_path %>
  # <% end %>
end