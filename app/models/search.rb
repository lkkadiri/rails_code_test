require 'net/http'
require 'uri'

class Search < ActiveRecord::Base
  attr_accessible :query
  has_many :google_search_results, dependent: :destroy
  has_many :twitter_search_results, dependent: :destroy
  has_many :user_searches
  has_many :users, through: :user_searches

  def google_search
    if self.updated_at <= 5.minutes.ago || self.google_search_results.empty?
      touch
      self.google_search_results.destroy_all

      uri_page1 = URI.parse("http://ajax.googleapis.com/ajax/services/search/web?v=1.0&rsz=5&q=#{self.query}")
      response_page1 = Net::HTTP.get(uri_page1)
      results_page1 = JSON.parse(response_page1)['responseData']['results']

      uri_page2 = URI.parse("http://ajax.googleapis.com/ajax/services/search/web?v=1.0&start=5&rsz=5&q=#{self.query}")
      response_page2 = Net::HTTP.get(uri_page2)
      results_page2 = JSON.parse(response_page2)['responseData']['results']

      results = results_page1 + results_page2

      results.map do |result|
        self.google_search_results.create title: result['titleNoFormatting'], link: result['url']
      end
    else
      self.google_search_results
    end
  end

  def twitter_search
    if self.updated_at <= 30.minutes.ago || self.twitter_search_results.empty?
      touch
      self.twitter_search_results.destroy_all

      uri= URI.parse("http://search.twitter.com/search.json?rpp=10&q=#{self.query}")
      response= Net::HTTP.get(uri)
      results = JSON.parse(response)['results']

      results.map do |result|
        self.twitter_search_results.create tweet_id: result['id'], username: result['from_user'], text: result['text']
      end
    else
      self.twitter_search_results
    end
  end

end
