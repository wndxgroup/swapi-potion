class Film < CDQManagedObject
  scope :released, sort_by(:release_date)

  def cell
    {
        title: title,
        subtitle: "Directed by: #{director}"
    }
  end
end
