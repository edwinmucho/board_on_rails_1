class UserController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
    User.create(
    email: params[:email],
    password: params[:password]
    )
    redirect_to '/'
  end
  
  def login
  end
  
  def login_process
    @user = User.find_by(email: params[:email])
    if @user
      if @user.password == params[:password]
        flash[:notice] = '로그인이 되었습니다.'
        session[:user_id] = @user.id
        redirect_to '/'
      else
        flash[:alert] = '패스워드가 잘못됬습니다.'
        redirect_to '/user/login'
      end
    else
      flash[:alert] = '회원 정보가 없습니다.'
      redirect_to '/user/new'
    end
  end
  
  def logout
    session.clear
    redirect_to '/'
  end
  
  def note
  end
end
