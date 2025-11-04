# https://guides.rubyonrails.org/active_job_basics.html#serializers
class MyModelSerializer < ActiveJob::Serializers::ObjectSerializer
  def klass = MyModel
  def serialize(my_model) = super("my_attr" => my_model.my_attr)
  def deserialize(hash) = MyModel.new hash
end
