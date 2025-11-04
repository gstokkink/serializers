# https://guides.rubyonrails.org/active_job_basics.html#serializers

# Repro steps:
#   1. Uncomment the code for ONE of the initialization processes below
#   2. `rails c`
#   3. my_model = MyModel.new "my_attr" => 42
#   4. ActiveModel::Serializers.serialize my_model
#        => ActiveJob::SerializationError

# This implementation from the guides doesn't work:
Rails.application.config.active_job.custom_serializers << MyModelSerializer

# This doesn't work:
# Rails.application.config.to_prepare do
#   Rails.application.config.active_job.custom_serializers << MyModelSerializer
# end

# This works, but uses private API, and causes trouble when initializing the db.
# (the db problem is not reproduced here):
# Rails.application.config.active_job.custom_serializers << MyModelSerializer
# Rails.application.config.to_prepare do
#   ActiveJob::Serializers.add_serializers Rails.application.config.active_job.custom_serializers
# end
