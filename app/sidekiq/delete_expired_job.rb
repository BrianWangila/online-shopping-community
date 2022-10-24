class DeleteExpiredJob
  include Sidekiq::Job

  def perform()
    # Do something
    # expired=Product.where("expire_at <?",Time.now)
    # expired.destroy_all
  end
end
