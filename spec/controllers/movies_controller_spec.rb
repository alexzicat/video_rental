require 'spec_helper'

describe MoviesController do

  before(:each) do
    @back_to_the_future = mock_model(Movie, name: 'Back to the Future', director: 'Robert Zemeckis')
    @back_to_the_future2 = mock_model(Movie, name: 'Back to the Future 2', director: 'Robert Zemeckis')
  end

  describe 'Available movies' do
    it 'should load all movies' do

      ## EXPECTATIONS
      Movie.should_receive(:all).and_return [@back_to_the_future]

      ## ACTION
      get :index

      ## RESPONSE
      response.body.should == [@back_to_the_future].to_json
    end
  end

  describe 'Adding a movie' do
    it 'should create a movie' do

      ## EXPECTATIONS
      Movie.should_receive(:create).with('name' => 'Back to the Future 2', 'director' => 'Robert Zemeckis')
      Movie.should_receive(:all).and_return [@back_to_the_future, @back_to_the_future2]

      ## ACTION
      get :create, movie: {name: 'Back to the Future 2', director: 'Robert Zemeckis'}

      ## RESPONSE
      response.body.should == [@back_to_the_future, @back_to_the_future2].to_json
    end
  end

  describe 'Removing a movie' do
    it 'should delete a movie' do

      ## EXPECTATIONS
      Movie.should_receive(:destroy).with('2')
      Movie.should_receive(:all).and_return [@back_to_the_future]

      ## ACTION
      get :destroy, id: '2'

      ## RESPONSE
      response.body.should == [@back_to_the_future].to_json
    end
  end
end
