class Search < ApplicationRecord
    has_many :products
    
    after_create :crawl
    
   

    def crawl
        c=Crawler.new(self.search_term,self.id)
        c.amazon
        c.ebay
        c.jumia
    end
end
