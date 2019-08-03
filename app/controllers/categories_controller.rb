class CategoriesController < ApplicationController
before_action :set_category, only: %i[show update edit destroy]

  def index
    @categories = Category.all
  end
  
  def new
      @category = Category.new
  end

  def create
      
      if @category.save
        redirect_to categories_path
        flash[:notice] = "Categoria creada satisfactoriamente"        
      else
        render :new
      end  
  end

  def edit
    
  end

  def update
    
      if @category.update(category_params)
        redirect_to categories_path, notice: "La Categoría ha sido Editada"
      else
        render :edit
      end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "La Categoría ha sido Eliminada"    
  end



  private

  def category_params
    params.require(:category).permit(:name)
  end  

  def set_category
    @category = Category.find(params[:id])
  end

end
