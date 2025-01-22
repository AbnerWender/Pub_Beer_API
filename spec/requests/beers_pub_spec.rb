require 'swagger_helper'
RSpec.describe 'BeersPubs API', type: :request do
	path '/beers_pubs' do
		get 'Retrieves all beers_pubs' do
			tags 'BeersPubs'
			produces 'application/json'

			response '200', 'beers_pubs found' do
				run_test!
			end

			response '404', 'beers_pubs not found' do
				run_test!
			end
		end

		post 'Creates a beers_pub' do
			tags 'BeersPubs'
			consumes 'application/json'
			parameter name: :beers_pub, in: :body, schema: {
				type: :object,
				properties: {
					beer_id: { type: :integer },
					pub_id: { type: :integer }
				},
				required: [ 'beer_id', 'pub_id' ]
			}

			response '201', 'beers_pub created' do
				let(:beers_pub) { { beer_id: 1, pub_id: 1 } }
				run_test!
			end

			response '422', 'invalid request' do
				let(:beers_pub) { { beer_id: 1 } } # Missing pub_id
				run_test!
			end
		end
	end

	path '/beers_pubs/{id}' do
		parameter name: :id, in: :path, type: :string

		get 'Retrieves a beers_pub' do
			tags 'BeersPubs'
			produces 'application/json'

			response '200', 'beers_pub found' do
				let(:id) { BeersPub.create(beer_id: 1, pub_id: 1).id }
				run_test!
			end

			response '404', 'beers_pub not found' do
				let(:id) { 'invalid' }
				run_test!
			end
		end

		delete 'Deletes a beers_pub' do
			tags 'BeersPubs'

			response '204', 'beers_pub deleted' do
				let(:id) { BeersPub.create(beer_id: 1, pub_id: 1).id }
				run_test!
			end

			response '404', 'beers_pub not found' do
				let(:id) { 'invalid' }
			end
		end
	end
end
