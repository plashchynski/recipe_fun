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
  end

  describe "GET new" do
    it "should render the new template" do
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
end
