require 'rails_helper'

RSpec.describe RecipesController do
  fixtures :recipes, :users
  render_views

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "should contain the title of a test recipe" do
      recipe = recipes(:humus)
      get :index
      expect(response.body).to include(recipe.title)
    end
  end
end
