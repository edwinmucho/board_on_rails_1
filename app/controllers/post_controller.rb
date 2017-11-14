class PostController < ApplicationController
  def index #게시글 보여주는 페이지
    @posts = Post.all
  end

  def new # 게시글 작성하는 form 있는 페이지
  end

  def create # 작성된 게시글 db에 넣는 액션
    
    Post.create(
      title: params[:title],
      content: params[:content],
      user_id: session[:user_id]
    )
    
    redirect_to '/'
  end

  def show # 한개의 게시글 보는 페이지
    @post = Post.find(params[:id])
    
    
    
  end

  def create_comment # 해당하는 글의 댓글 다는 액션
    Comment.create(
      post_id: params[:id],
      content: params[:content]
      )
    
    redirect_to :back
  end
end
