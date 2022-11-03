require 'rails_helper'

RSpec.describe SearchesController, type: :controller do 
  it 'has create method' do
    search = Search.find_by('search_term': 'search_term')
  end

  it 'has trends method' do
    search = Search.all
    search.order_by_count
  end

  it 'has index method' do 
    
  end
end