class FilmsScreen < PM::DataTableScreen
  model Film, scope: :released

  title "Films"
  stylesheet FilmsScreenStylesheet

  def on_load
  end

  def show(args={})
    open( FilmScreen.new(episode_id: args[:episode_id]))
  end

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    reapply_styles
  end
  
end
