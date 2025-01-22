get 'Retrieves a food pairing' do
    tags 'Food Pairings'
    produces 'application/json'

    response '200', 'food pairing found' do
      let(:id) { FoodPairing.create(description: 'Pizza', beer_id: 1).id }
      run_test!
    end

    response '404', 'food pairing not found' do
      let(:id) { 'invalid' }
      run_test!
    end


  put 'Updates a food pairing' do
    tags 'Food Pairings'
    consumes 'application/json'
    parameter name: :food_pairing, in: :body, schema: {
      type: :object,
      properties: {
        description: { type: :string },
        beer_id: { type: :integer }
      },
      required: [ 'description', 'beer_id' ]
    }

    response '200', 'food pairing updated' do
      let(:id) { FoodPairing.create(description: 'Pizza', beer_id: 1).id }
      let(:food_pairing) { { description: 'Updated Pizza', beer_id: 2 } }
      run_test!
    end

    response '404', 'food pairing not found' do
      let(:id) { 'invalid' }
      let(:food_pairing) { { description: 'Updated Pizza', beer_id: 2 } }
      run_test!
    end
  end

  delete 'Deletes a food pairing' do
    tags 'Food Pairings'

    response '204', 'food pairing deleted' do
      let(:id) { FoodPairing.create(description: 'Pizza', beer_id: 1).id }
      run_test!
    end

    response '404', 'food pairing not found' do
      let(:id) { 'invalid' }
    end
  end
