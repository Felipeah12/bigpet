# frozen_string_literal: true

class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: %i[edit show update destroy]

  def index
    @brands = Brand.active.sort_created_at
  end

  def new
    @brand = Brand.new
  end

  def show; end

  def create
    @brand = Brand.new(brand_parametters)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, notice: 'Marca creada exitosamente!' }
        format.json { render :index, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @brand.update(brand_parametters)
        format.html { redirect_to brands_path, notice: 'Marca actualizada exitosamente!' }
        format.json { render :index, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @brand.soft_delete!

    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Marca eliminada exitosamente!' }
      format.json { head :no_content }
    end
  end

  private

  def find_brand
    @brand = Brand.find_by!(id: params[:id])
  end

  def brand_parametters
    params.require(:brand).permit(:name, :size_type, :kind_of_pet, :min_width, :max_width, :gram_amount, :price, :image)
  end
end
