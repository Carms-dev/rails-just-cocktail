class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @search = params[:search]
      # sql_query = "
      #   cocktails.name @@ :query \
      #   OR ingredients.name @@ :query \
      # "
      # @cocktails = Cocktail.joins(:doses, :ingredients).where(sql_query, query: "%#{params[:search]}%")
      @cocktails = Cocktail.where("lower(#{:name}) LIKE ?", "%#{@search.downcase}%")
    else
      @cocktails = Cocktail.all
    end
    @random_cocktail = Cocktail.all.sample
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy

    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :url)
  end
end
