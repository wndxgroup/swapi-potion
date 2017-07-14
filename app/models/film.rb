class Film < CDQManagedObject
  scope :released, sort_by(:release_date)

  def cell
    {
        title: title,
        subtitle: "Directed by: #{director}",
        action: :show,
        arguments: { episode_id: episode_id},
        accessory_type: :disclosure_button
    }
  end
end
