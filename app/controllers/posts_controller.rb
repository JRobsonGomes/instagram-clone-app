class PostsController < ApplicationController
  include SuggestedUsers

  before_action :set_post, only: %i[show]
  before_action :set_suggested_users, only: %i[index]

  def index
    #flash.now[:notice] = "Deu Certo"
    #flash.now[:alert] = "Deu Ruim"

    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(created_by: current_user)) #associa um post ao usuario atual

    if @post.save
      redirect_to @post, notice: "Post foi criado com sucesso."
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:description)
  end
end
