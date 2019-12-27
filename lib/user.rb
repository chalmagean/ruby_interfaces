require_relative "./json"

class User
  # include JSON
  attr_reader :name, :age

  def initialize(name = nil, age = nil)
    @name = name
    @age = age
  end

  def to_json
    %({"name":"#{name}","age":"#{age}"})
  end

  def from_json(json)
    h = json
      .delete(" ")
      .split(",")
      .flat_map { |j| j.scan(/"(.+)":\s*"(.+)"/) }
      .to_h
    @name = h["name"]
    @age = h["age"]
  end
end

john = User.new("John", 32)
puts john.to_json
john.from_json('{"name": "BOB", "age": "46"}')
puts john.to_json
