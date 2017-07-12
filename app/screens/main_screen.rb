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
              title: set.titleize
          }
        end
     }]
  end
  

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
  
end
