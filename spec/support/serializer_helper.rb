module SerializerHelper
  def serialize(obj)
    serializer_class = "#{obj.class.name}Serializer".constantize
    serializer = serializer_class.send(:new, obj)
    serializer.as_json
  end
end
