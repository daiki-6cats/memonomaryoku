class MemosController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def new
  end

  def create
    @memo = current_user.memos.build(memo_params)
    if @memo.save
      flash[:success] = "メモを投稿しました"
      redirect_to root_url
    else
      @memos = current_user.memos.order(id: :desc).page(params[:page])
      flash.now[:danger] = "メモの送信に失敗しました"
      render "toppages/index"
    end
  end

  def destroy
    @memo.destroy
    flash[:success] = "メモを削除しました"
    redirect_back(fallback_location: root_path)
  end

  def memo_params
    params.require(:memo).permit(:title, :fact, :abstract, :diversion, :wrap)
  end
  
  def correct_user
    @memo = current_user.memos.find_by(id: params[:id])
    unless @memo
    redirect_to root_url
    end
  end
end
