require "spec_helper"

SingleCov.covered!

describe ThreadAncestors do
  it "has a VERSION" do
    expect(ThreadAncestors::VERSION).to match(/^[\.\da-z]+$/)
  end
end
