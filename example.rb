
require 'rubygems'
require 'dm-core'

require 'lib/dm-echo-adapter'

DataMapper.setup(:default, :adapter => :echo, :echo => {:adapter => :in_memory})

class Article
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :text, Text

end

a = Article.create(:title => "Test", :text => "Lorem Ipsum")

Article.all.to_a

a.title = "Test Update"
a.save

a.destroy



