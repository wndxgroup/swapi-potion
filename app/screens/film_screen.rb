class FilmScreen < PM::Screen
  attr_accessor :episode_id

  stylesheet FilmScreenStylesheet

  def on_load
    self.title = "Star Wars - Episode #{episode_id}"
    film = Film.where(:episode_id).eq(episode_id).first

    append(UILabel, :title_label).data(film.title)
    append(UILabel, :name_label).data(film.director)
    append(UILabel, :name_label).data(film.producer)
    append(UILabel, :date_label).data(film.release_date.to_date.to_formatted_s(:long))
    append(UITextView, :crawl_text).data(film.opening_crawl)
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
