class SwapiStore < AFHTTPSessionManager
  class << self
    include CDQ
    def client
      mp "In client"
      @@client ||= AFHTTPSessionManager.alloc.initWithBaseURL('https://swapi.co'.to_url)
      mp "Got client"
      @@client
    end

    def load_films
      mp "In load files"
      client.GET('/api/films',
        parameters:nil,
        success: lambda { |request, response|
          mp "In success"
          response["results"].each do |raw|
            Film.create(
                episode_id: raw['episode_id'],
                title: raw['title'],
                producer: raw['producer'],
                director: raw['director'],
                opening_crawl: raw['opening_crawl'],
                url: raw['url'],
                release_date: NSDate.dateWithNaturalLanguageString(raw['release_date'])
            )
          end
          cdq.save
        }, failure: lambda {|request, error| # correct number of parameters is important
          mp "In failure"
        })
    end
  end

end