class Google
  def self.search(query)
    results = RestClient.get "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=#{query}"
  end
end