require 'swagger_helper'
RSpec.describe 'Pubs API', type: :request do
path '/pubs' do
    get 'Retrieves all pubs' do
      tags 'Pubs'
      produces 'application/json'

      response '200', 'pubs found' do
        run_test!
      end

      response '404', 'pubs not found' do
        run_test!
      end
    end

    post 'Creates a pub' do
      tags 'Pubs'
      consumes 'application/json'
      parameter name: :pub, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string }
        },
        required: [ 'name', 'location' ]
      }

      response '201', 'pub created' do
        let(:pub) { { name: 'My Pub', location: 'My Location' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pub) { { name: 'My Pub' } } # Missing location
        run_test!
      end
    end
  end

  path '/pubs/{id}' do
    parameter name: :id, in: :path, type: :string

    get 'Retrieves a pub' do
      tags 'Pubs'
      produces 'application/json'

      response '200', 'pub found' do
        let(:id) { Pub.create(name: 'My Pub', location: 'My Location').id }
        run_test!
      end

      response '404', 'pub not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a pub' do
      tags 'Pubs'
      consumes 'application/json'
      parameter name: :pub, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string }
        },
        required: [ 'name', 'location' ]
      }

      response '200', 'pub updated' do
        let(:id) { Pub.create(name: 'My Pub', location: 'My Location').id }
        let(:pub) { { name: 'Updated Pub', location: 'Updated Location' } }
        run_test!
      end

      response '404', 'pub not found' do
        let(:id) { 'invalid' }
        let(:pub) { { name: 'Updated Pub', location: 'Updated Location' } }
        run_test!
      end
    end

    delete 'Deletes a pub' do
      tags 'Pubs'

      response '204', 'pub deleted' do
        let(:id) { Pub.create(name: 'My Pub', location: 'My Location').id }
        run_test!
      end

      response '404', 'pub not found' do
        let(:id) { 'invalid' }
      end
    end
  end
