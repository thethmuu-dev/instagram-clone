class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(image_post_id: params[:image_post_id])
        redirect_to image_posts_path, notice: "Favorited #{ favorite.user.username }'s post"
    end

    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to image_posts_path, notice: "Favorite removed"
    end
end
