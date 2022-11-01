require 'rails_helper'

RSpec.describe SearchesController, type: :controller do 
  it 'is found successfully by search_term' do
    # b = Search.new
    search = Search.find_by('search_term': 'search_term')
    expect(search).to be_truthy
  end
end