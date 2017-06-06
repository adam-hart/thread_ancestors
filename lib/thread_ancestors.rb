module ThreadAncestors
  def initialize
    @_parent = Thread.current
    super
  end

  def ancestors
    Enumerator.new do |enum|
      t = Thread.current
      while t = t.parent
        enum.yield t
      end
    end.lazy
  end

  def parent
    @_parent
  end
end

Thread.prepend(ThreadAncestors)
