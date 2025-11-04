require "test_helper"

class CustomSerializersTest < ActiveJob::TestCase
  # This test passes regardless of the initialization scheme.
  test "object serializes and deserializes" do
    hash = ActiveJob::Serializers.serialize my_model
    reconstituted_model = ActiveJob::Serializers.deserialize hash
    assert_instance_of MyModel, reconstituted_model
    assert_equal 42, reconstituted_model.my_attr
  end

  def my_model = MyModel.new "my_attr" => 42
end
