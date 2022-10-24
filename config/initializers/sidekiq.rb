# schedule_file="config/schedule.yml"

# if File.exist?(schedule_file) && Sidekiq.server?
#     Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end

job=Sidekiq::Cron::Job.create(name:"Delete expired - every 5min",cron:"* * * * *",class:"DeleteExpired")

# unless job.save
#     puts job.errors
# end