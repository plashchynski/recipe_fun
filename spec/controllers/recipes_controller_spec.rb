require 'rails_helper'

RSpec.describe RecipesController do
  fixtures :recipes, :users
  render_views

  let(:user) { users(:john) }
  let(:recipe) { recipes(:humus) }

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should contain the title of a test recipe" do
      get :index
      expect(response.body).to include(recipe.title)
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    it "renders the new template" do
      get :show, params: { id: recipe.id }
      expect(response).to render_template("show")
    end
  end
end
