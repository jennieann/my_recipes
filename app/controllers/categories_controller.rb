class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            flash[:notice] = "Category has been created."
            redirect_to @category
        else
            flash[:alert] =  "The category was not saved."
            render "new"
        end
    end

    def show

    end

    def edit

    end

    def update

        if @category.update(category_params)
            flash[:notice] = "Category was updated."
            redirect_to @category
        else
            flash[:alert] = "Category was not updated."
            render "edit"
        end
    end

    def destroy

        @category.destroy

        flash[:notice] = "Category was deleted."
        redirect_to categories_path

    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end

    def set_category
        @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The category your are looking for could not be found"
        redirect_to categories_path
    end
end
