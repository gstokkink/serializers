# https://guides.rubyonrails.org/active_job_basics.html#serializers
class MyModel
  attr_reader :my_attr
  def initialize(args)
    @my_attr = args["my_attr"]
  end
end
