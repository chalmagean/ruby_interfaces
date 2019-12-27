require "spec_helper"
require_relative "../lib/user"

RSpec.describe User do
  it_behaves_like "a JSON serializable object"
end
