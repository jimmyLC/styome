class Admin::GirlsController < ApplicationController
  before_action :find_girl, only: [:show, :edit, :update, :destroy]
  before_action :admin_reqired
  before_action :authenticate_user!

  def index
    @girls = Girl.all
    @girl = Girl.new
  end


  def create
    @girl = Girl.new(girl_params)
    if @girl.save
      redirect_to admin_girls_path
    end
  end

  def edit

  end

  def update
    if @girl.update(girl_params)
      redirect_to admin_girls_path
    end
  end

  def destroy
    @girl.destroy
    redirect_to admin_girls_path
  end

  private

  def find_girl
    @girl = Girl.find(params[:id])
  end

  def girl_params
    params.require(:girl).permit(:name, :avatar)
  end
end
