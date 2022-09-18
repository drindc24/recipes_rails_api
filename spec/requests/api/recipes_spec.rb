require 'swagger_helper'

RSpec.describe 'api/recipes', type: :request do
  let(:json_response){ JSON.parse response.body }
  let!(:recipe_1) { create(:recipe, title: 'Pork Adobo') }
  let!(:recipe_2) { create(:recipe, title: 'Chicken Adobo') }
  let!(:recipe_3) { create(:recipe, :normal, title: 'Tinola') }
  let!(:recipe_4) { create(:recipe, :normal, title: 'Beef Bulalo') }
  let!(:recipe_5) { create(:recipe, :challenging, title: 'Pork Sisig') }

  path '/api/recipes/{id}' do
    delete 'Destroy recipes' do
      tags 'delete'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    put 'Update recipes' do
      tags 'update'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipe: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
              [
                {
                  'id' => 'integer',
                  'created_at' => 'datetime',
                  'updated_at' => 'datetime',
                  'unit' => 'enum_type',
                  'amount' => 'float',
                  'recipe_id' => 'foreign_key'

                }
              ],
            'user_id' => 'foreign_key'
          },
          'error_object' => {}
        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:id) { create(:recipe).id }

        let(:params) do
          {
            recipe: {
              title: 'Updated Title'
            }
          }
        end
          
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes/{id}' do
    get 'Show recipes' do
      tags 'show'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_message' => 'string'

        }

        let(:resource_owner) { create(:user) }
        let(:token) { create(:access_token, resource_owner: resource_owner).token }
        let(:Authorization) { "Bearer #{token}" }
        let(:params) {}
        let(:id) { create(:recipe).id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes' do
    post 'Create recipes' do
      tags 'create'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          recipes: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              descriptions: {
                type: :text,
                example: 'text'
              },

              time: {
                type: :string,
                example: 'string'
              },

              difficulty: {
                type: :enum_type,
                example: 'enum_type'
              },

              category_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'recipes' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'descriptions' => 'text',

            'time' => 'string',

            'difficulty' => 'enum_type',

            'category_id' => 'foreign_key',

            'ingredients' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'unit' => 'enum_type',

      'amount' => 'float',

      'recipe_id' => 'foreign_key'

    }
  ],

            'user_id' => 'foreign_key'

          },

          'error_object' => {}

        }
        let(:params) do
          {
            recipe: {
              title: 'Sample Recipe',
              descriptions: 'This is a sample recipe!',
              time: '60 seconds',
              difficulty: 'normal'
            }
          }
        end
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/recipes?{search}' do
    get 'List recipes' do
      tags 'filter'
      consumes 'application/json'

      security [bearerAuth: []]
      parameter name: :search, in: :path, type: :string

      let(:resource_owner) { create(:user) }
      let(:token) { create(:access_token, resource_owner: resource_owner).token }
      let(:Authorization) { "Bearer #{token}" }
      let(:search) { CGI.unescape(search_params.to_query) }
      let(:search_params) { {} }
      response '200', 'no filter' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'unit' => 'enum_type',
            'amount' => 'float',
            'recipe_id' => 'foreign_key'
          }
        ],
  
            'user_id' => 'foreign_key'
  
          }
        ],
          'error_message' => 'string'
        }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end

      response '200', 'search by title' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'unit' => 'enum_type',
            'amount' => 'float',
            'recipe_id' => 'foreign_key'
          }
        ],
  
            'user_id' => 'foreign_key'
  
          }
        ],
          'error_message' => 'string'
        }

        let(:search_params) do
          {
            search: { title_cont: 'adobo' }
          }
        end
        let!(:recipe_1) { create(:recipe, title: 'Pork Adobo') }
        let!(:recipe_2) { create(:recipe, title: 'Chicken Adobo') }
        let!(:recipe_3) { create(:recipe, title: 'Tinola') }

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(json_response['recipes'].count).to eq 2
          expect(json_response['recipes'].map{|recipe| recipe['title']}).to contain_exactly('Pork Adobo', 'Chicken Adobo')
        end
      end

      response '200', 'filter by difficulty' do
        examples 'application/json' => {
          'total_pages' => 'integer',
          'recipes' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'title' => 'string',
            'descriptions' => 'text',
            'time' => 'string',
            'difficulty' => 'enum_type',
            'category_id' => 'foreign_key',
            'ingredients' =>
        [
          {
            'id' => 'integer',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
            'unit' => 'enum_type',
            'amount' => 'float',
            'recipe_id' => 'foreign_key'
          }
        ],
  
            'user_id' => 'foreign_key'
  
          }
        ],
          'error_message' => 'string'
        }

        let(:search_params) do
          {
            search: { difficulty_eq: '2' }
          }
        end
        let!(:recipe_1) { create(:recipe, title: 'Pork Adobo') }
        let!(:recipe_2) { create(:recipe, title: 'Chicken Adobo') }
        let!(:recipe_3) { create(:recipe, title: 'Tinola') }

        run_test! do |response|
          expect(response.status).to eq(200)
          expect(json_response['recipes'].count).to eq 1
          expect(json_response['recipes'].map{|recipe| recipe['title']}).to contain_exactly('Pork Sisig')
        end
      end
    end
  end
end
