class CookingsController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update, :destroy]


  def new
    @cooking = Cooking.new
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end

  # 投稿データの保存
  def create
    @cooking = Cooking.new(cooking_params)
    @cookings = Cooking.all
    @cooking.user_id = current_user.id
    if @cooking.save
      flash[:notice] = "You have created cooking successfully."
      redirect_to cooking_path(@cooking.id)
    else
      render :index
    end
  end

  def index
    @cookings = Cooking.all
    @cooking = Cooking.new
  end

  def show
    @cooking_new = Cooking.new
    @cooking = Cooking.find(params[:id])
    @user = @cooking.user
  end

  def edit
    @cooking = Cooking.find(params[:id])
  end

  def update
    @cooking = Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      flash[:notice] = "You have updated cooking successfully."
      redirect_to cooking_path(@cooking)
    else
      render :edit
    end
  end

end
