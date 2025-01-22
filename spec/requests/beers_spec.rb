# spec/requests/beers_spec.rb

require 'swagger_helper'

RSpec.describe 'Beers API', type: :request do
  path '/beers' do
    get 'Retrieves all beers' do
      tags 'Beers'
      produces 'application/json'

      response '200', 'beers found' do
        run_test!
      end

      response '404', 'beers not found' do
        run_test!
      end
    end

    post 'Creates a beer' do
      tags 'Beers'
      consumes 'application/json'
      parameter name: :beer, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          style: { type: :string }
        },
        required: [ 'name', 'style' ]
      }

      response '201', 'beer created' do
        let(:beer) { { name: 'IPA', style: 'Hoppy' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:beer) { { name: 'IPA' } } # Missing style
        run_test!
        end
    end
  end

  path '/beers/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Retrieves a beer' do
      tags 'Beers'
      produces 'application/json'

      response '200', 'beer found' do
        let(:id) { Beer.create(name: 'IPA', style: 'Hoppy').id }
        run_test!
      end

      response '404', 'beer not found' do
        let(:id) { 'invalid' }
        run_test!
        end
    end

    put 'Updates a beer' do
      tags 'Beers'
      consumes 'application/json'
      parameter name: :beer, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          style: { type: :string }
        },
        required: [ 'name', 'style' ]
      }

      response '200', 'beer updated' do
        let(:id) { Beer.create(name: 'IPA', style: 'Hoppy').id }
        let(:beer) { { name: 'New IPA', style: 'New Hoppy' } }
        run_test!
      end

      response '404', 'beer not found' do
        let(:id) { 'invalid' }
        let(:beer) { { name: 'New IPA', style: 'New Hoppy' } }
        run_test!
      end
    end

    delete 'Deletes a beer' do
      tags 'Beers'

      response '204', 'beer deleted' do
        let(:id) { Beer.create(name: 'IPA', style: 'Hoppy').id }
        run_test!
      end

      response '404', 'beer not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end