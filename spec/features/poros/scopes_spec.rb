require "rails_helper"

RSpec.describe "scope can generate" do
  it "makes a scope" do
    scope = Scope.new

    scope.description.should an_instance_of(String)
  end
end
