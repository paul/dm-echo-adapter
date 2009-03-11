
require 'dm-core'

module DataMapper::Adapters
class EchoAdapter

  VERSION = '0.1.0'

  # Returns the version string for the library.
  #
  def self.version
    VERSION
  end

  def initialize(name, options)
    @io = options[:io] || STDOUT

    @adapter = DataMapper.setup("wrapped_#{name}".intern, options[:echo])
  end

  def echo(method, args = {}, &block)
    @io.puts("##{method}")
    args.each do |name, value|
      @io.puts("#{name}: #{value.inspect}")
    end
    result = yield
    @io.puts(" # => #{result.inspect}\n\n")
    result
  end

  def create(resources)
    echo(:create, :resources => resources) do
      @adapter.create(resources)
    end
  end

  def read(query)
    echo(:read, :query => query) do
      @adapter.read(query)
    end
  end

  def update(attributes, query)
    echo(:update, :attributes => attributes, :query => query) do
      @adapter.update(attributes, query)
    end
  end

  def delete(query)
    echo(:delete, :query => query) do
      @adapter.delete(query)
    end
  end

end  # class EchoAdapter
end # module DataMapper::Adapters


# EOF
