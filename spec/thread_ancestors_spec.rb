require "spec_helper"

SingleCov.covered!

describe ThreadAncestors do
  it "saves the parent thread" do
    Thread.new do
      expect(Thread.current.parent).to equal(Thread.main)
    end.join
  end

  it "saves multiple ancestors" do
    Thread.new do
      Thread.new do
        expect(Thread.current.ancestors.count).to equal(2)
      end
    end.join
  end

  it "can access ancestors multiple layers deep" do
    Thread.new do
      Thread.new do
        expect(Thread.current.ancestors.last).to equal(Thread.main)
      end
    end.join
  end

  it "accesses ancestors lazily" do
    count = 0

    Thread.new do
      Thread.new do
        Thread.new do
          Thread.current.ancestors.collect { count += 1 }.first(2)
        end.join
      end.join
    end.join

    expect(count).to equal(2)
  end

  it "has a VERSION" do
    expect(ThreadAncestors::VERSION).to match(/^[\.\da-z]+$/)
  end
end
