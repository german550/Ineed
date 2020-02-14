class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to favorites_path
  end

  def index
    @favorites = current_user.favorites
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to "/favorites/"
  end

  private
    def favorite_params
        params.permit(:project_id)
    end
end
