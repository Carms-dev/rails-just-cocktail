class DosesController < ApplicationController
  before_action :find_dose, only: [:edit, :update, :destroy]

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end
end
