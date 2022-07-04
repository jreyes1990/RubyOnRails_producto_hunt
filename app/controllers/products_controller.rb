class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.persisted?
      redirect_to products_path, notice: 'El producto se creo de forma exitosa.'
    else
      render :new, status: :unprocessable_entity
      puts "************************************************"
      puts @product.errors.full_messages
      puts "************************************************"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :visible)
  end
end
