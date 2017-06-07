Provides a lazily loaded mechanism for a Ruby `Thread` to access its ancestors.

Install
=======

```Bash
gem install thread_ancestors
```

Usage
=====

```Ruby
require 'thread_ancestors'

# Get your parent Thread
Thread.current.parent

# Get your ancestor Threads
Thread.current.ancestors

# Access just your previous two ancestor Threads
Thread.current.ancestors.first(2)

# Access your parent's context
Thread.current[:key] = 'Hello'
Thread.new do
  Thread.current.parent[:key] #=> Hello
end

# Access all your ancestors' context
Thread.current.ancestors.map do |thread| 
  thread[:key]
end
```

Author
======
Adam Hart<br/>
pididiot1@gmail.com<br/>
License: MIT<br/>
[![Build Status](https://travis-ci.org/adam-hart/thread_ancestors.png)](https://travis-ci.org/adam-hart/thread_ancestors)
