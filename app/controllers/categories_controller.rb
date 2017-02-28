class CategoriesController < ApplicationController
    def index
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
            redirect_to @category, alert: "Category was not saved."
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name, :description)
    end
end
