require 'rails_helper'

RSpec.describe SearchesController, type: :controller do 
  it 'has create method' do
    search = Search.find_by('search_term': 'search_term')
    expect(search).to be_valid
  end

  it 'has trends method' do

  end

  it 'has index method' do 

  end
end