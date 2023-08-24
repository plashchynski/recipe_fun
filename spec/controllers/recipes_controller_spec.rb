require 'rails_helper'

RSpec.describe RecipesController do
  fixtures :recipes, :users
  render_views

  let(:user) { users(:john) }
  let(:recipe) { recipes(:humus) }

  describe "GET index" do
    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should contain the title of a test recipe" do
      get :index
      expect(response.body).to include(recipe.title)
    end

    it "should not display not published recipes" do
      secret_salad = recipes(:secret_salad)
      get :index
      expect(response.body).not_to include(secret_salad.title)
    end
  end

  describe "GET new" do
    it "should render the new template" do
      sign_in user
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    it "should render the new template" do
      get :show, params: { id: recipe.id }
      expect(response).to render_template("show")
    end

    it "should not display the edit button to anonymous user" do
      get :show, params: { id: recipe.id }
      expect(response.body).not_to include("Edit")
    end

    it "should not display the delete button to anonymous user" do
      get :show, params: { id: recipe.id }
      expect(response.body).not_to include("Delete")
    end

    it "should display the edit button to the recipe author" do
      sign_in user
      get :show, params: { id: recipe.id }
      expect(response.body).to include("Edit")
    end

    it "should display the delete button to the recipe author" do
      sign_in user
      get :show, params: { id: recipe.id }
      expect(response.body).to include("Delete")
    end
  end

  describe "POST create" do
    let(:recipe_params) do
      {
        title: "Test Recipe",
        description: "Test Description",
      }
    end

    it "should not create a new recipe if user not signed in" do
      expect do
        post :create, params: { recipe: recipe_params }
      end.not_to change(Recipe, :count)
      expect(response).to be_redirect
    end

    it "should create a new recipe if user signed in" do
      sign_in user
      expect do
        post :create, params: { recipe: recipe_params }
      end.to change(Recipe, :count)
      expect(response).to be_redirect

      created_recipe = Recipe.last
      expect(created_recipe.title).to eq(recipe_params[:title])
      expect(created_recipe.description).to eq(recipe_params[:description])
      expect(created_recipe.author).to eq(user)
    end
  end
end
