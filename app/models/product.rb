class Product < ApplicationRecord

    default_scope ->{where("expire_at is NULL OR expire_at<?",Time.now)}

    before_save :set_expire_at
    # before_update :set_expire_at

    private 
    def set_expire_at
        self.expire_at=Time.now + 1.minute
    end
    
    def create_or_update
        if record
    end

    def record
        Product.find_by(name:self.name,shop:self.shop)
    end
end
