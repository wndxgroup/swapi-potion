class MainScreen < PM::TableScreen
  searchable placeholder: "Search Datasets", no_results: "Sorry, Try Again"

  title "Star Wars - API"
  stylesheet MainScreenStylesheet

  def on_load
  end

  SWAPI_DATASETS = %w( planets spaceships vehicles people films species )
  def table_data
    [{
        title: "Datasets",
        cells: SWAPI_DATASETS.sort.map do |set|
          {
              title: set.titleize,
              action: :select_dataset,
              arguments: {dataset: set},
              accessory_type: :disclosure_indicator
          }
        end
     }]
  end

  def select_dataset(args={})
    case args[:dataset]
      when 'films'
        open FilmsScreen.new(navbar: true)
      else
        puts "Not implemented"
    end
  end

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
  
end
