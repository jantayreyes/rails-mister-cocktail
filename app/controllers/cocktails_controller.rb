class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index 
    @cocktails= Cocktail.all
  end

  def show 
    @dose = Dose.new
  end 

  def new 
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # params[:cocktail][:ingredient_ids].shift
    # params[:cocktail][:ingredient_ids].each do |ingredient|
    #   Dose.create(ingredient_id: ingredient, cocktail_id: @cocktail.id)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
