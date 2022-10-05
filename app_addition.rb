class Foo

    attr_accessor :bar, :baz, :bat

  def initialize(bar, baz, bat)
    @bar = bar
    @baz = baz
    @bat = bat
  end

    # Serialize Foo object with its class name and arguments
    def to_json(*args)
      {
        JSON.create_id  => self.class.name,
        'a'             => [ @bar, @baz, @bat ]
      }.to_json(*args)
    end
    # Deserialize JSON string by constructing new Foo object with arguments.
    def self.json_create(object)
      new(*object['a'])
    end
end
