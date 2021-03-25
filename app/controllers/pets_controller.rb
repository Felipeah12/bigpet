# frozen_string_literal: true

class PetsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_customer
  before_action :find_pet, only: %i[show edit update destroy]

  def index
    @pets = @user.pets.active.sort_created_at
  end

  def show; end

  def new
    @pet = @user.pets.new
  end

  def edit; end

  def create
    @pet = @user.pets.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to route, notice: 'Mascota creada exitosamente!' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to route, notice: 'Mascota actualizada exitosamente!' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pet.soft_delete?

    respond_to do |format|
      format.html { redirect_to route, notice: 'Mascota eliminada exitosamente!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_customer
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def find_pet
    @pet = Pet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pet_params
    params.require(:pet).permit(:name, :age, :kind_of_pet, :weight, :gender, :user_id)
  end

  def route
    current_user.admin? ? user_pets_path(@user) : @user
  end
end
