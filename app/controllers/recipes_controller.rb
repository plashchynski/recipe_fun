# This is a recipe controller.
# It is used to manage the recipes.

class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /recipes or /recipes.json
  def index
    @mode = params[:mode] || "all"

    # pagination
    @recipes = Recipe.order(:created_at).page(params[:page]).per(params[:per_page].present? ? params[:per_page] : 5)

    # search
    if params[:search].present?
      @recipes = @recipes.search(params[:search])
    end

    # "My recipes" mode
    if @mode == "my" && user_signed_in?
      @recipes = @recipes.where(author_id: current_user.id)
    end

    # author see all recipes, including unpublished
    if user_signed_in?
      # Show all recipes to the author
      @recipes = @recipes.where("published IS TRUE OR author_id = ?", current_user.id).order(created_at: :desc)
    else
      @recipes = @recipes.published.order(created_at: :desc)
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.author = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:title, :image, :remove_image, :description, :directions, :published)
    end
end
