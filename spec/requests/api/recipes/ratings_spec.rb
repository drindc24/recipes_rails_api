require 'swagger_helper'

RSpec.describe 'api/recipes/ratings', type: :request do
  let(:json_response){ JSON.parse response.body }
  let!(:recipe_1) { create(:recipe, title: 'Pork Adobo') }
  let!(:recipe_2) { create(:recipe, title: 'Chicken Adobo') }
  let!(:recipe_3) { create(:recipe, :normal, title: 'Tinola') }
  let!(:recipe_4) { create(:recipe, :normal, title: 'Beef Bulalo') }
  let!(:recipe_5) { create(:recipe, :challenging, title: 'Pork Sisig') }

  path '/api/recipes/{recipe_id}/ratings' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      parameter name: :recipe_id, in: :path, type: :string
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          rating: {
            type: :object,
            properties: {
              amount: {
                type: :string,
                example: '5'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              comment: {
                type: :text,
                example: 'This is a sample rating'
              }

            }
          }
        }
      }
      response '204', 'create' do
        let(:recipe) { create(:recipe) }
        let(:recipe_id) { recipe.id }
        let(:user) { create(:user) }
        let(:params) do
          {
            rating: {
              amount: '5',
              user_id: user.id
            }
          }
        end
        
        run_test! do |response|
          expect(response.status).to eq(204)
        end
      end
    end
  end
end
