class ProductCategoriesController < ApplicationController
    def new
        @ProductCategory=ProductCategory.new
      end

      def create
        @product=Product.find(params[:id])
        @ProductCategory=@product.product_categories.new(category_params)
        if @ProductCategory.save
            redirect_to list_categories_path(@product)
        else
            render :new
        end
    #render plain: params.inspect    
      end

      def index
        @product=Product.find(params[:id])
      end


      def edit
        @product_category=ProductCategory.find(params[:id])
      end
    
      def update
        @product_category=ProductCategory.find(params[:id])
        render plain: params.inspect    
        if(@product_category.update(category_params))
          flash[:notice] = "record updated!!!!"
          redirect_to  list_categories_path
        else
          render :edit
        end
    
      end   
      def destroy
        @product_category=ProductCategory.find(params[:id])
        @product_category.destroy
        redirect_to  list_categories_path
      end
      private
      def category_params
        params.require(:ProductCategory).permit(:name,:price,:quantity,:description)
      end

end
