class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    memo = Memo.find(params[:memo_id])
    current_user.favorite(memo)
    flash[:success] = "メモをお気に入りしました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    memo = Memo.find(params[:memo_id])
    current_user.unfavorite(memo)
    flash[:success] = "メモのお気に入りを解除しました。"
    redirect_back(fallback_location: root_path)
  end
end
