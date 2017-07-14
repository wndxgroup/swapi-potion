class SwapiStore
  def self.client
    @@client ||= AFMotion::Client.build('https://swapi.co') do
      header "Accept", "application/json"
      response_serializer :json
    end
  end

  def self.load_films
    self.client.get('api/films') do |result|
      result.object["results"].each do |raw|
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
    end
  end
end