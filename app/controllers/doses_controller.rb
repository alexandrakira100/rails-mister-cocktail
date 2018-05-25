class DosesController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose = Dose.new(cocktail_id:params[:cocktail_id])

  end

  def create
     @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)

    # we need `restaurant_id` to asssociate review with corresponding restaurant
    # @dose.cocktail = Cocktail.find(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
