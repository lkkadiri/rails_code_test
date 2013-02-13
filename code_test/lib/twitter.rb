class Twitter
  def self.search(query)
    results = RestClient.get "http://search.twitter.com/search.json?q=#{query}"
    results 
  end
end