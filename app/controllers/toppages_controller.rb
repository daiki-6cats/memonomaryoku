class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    if logged_in?
      @memo = current_user.memos.build #form_with用
      @memos = current_user.memos.order(id: :desc).page(params[:page])
      #memosはトップページにmemo一覧を作るため
    end
  end
end
