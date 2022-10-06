class Foo
  attr_accessor :bar, :baz

  def initialize(bar, baz)
    @bar = bar
    @baz = baz
  end

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {

      JSON.create_id => @bar,
      'data' => @baz
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['data'])
  end
end
