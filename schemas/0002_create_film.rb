schema "0002 Create Film" do

  # Examples:
  #
  # entity "Person" do
  #   string :name, optional: false
  #
  #   has_many :posts
  # end
  #
  # entity "Post" do
  #   string :title, optional: false
  #   string :body
  #
  #   datetime :created_at
  #   datetime :updated_at
  #
  #   has_many :replies, inverse: "Post.parent"
  #   belongs_to :parent, inverse: "Post.replies"
  #
  #   belongs_to :person
  # end


  entity "Film" do
    integer32 :episode_id
    string :title
    string :producer
    string :director
    datetime :release_date
    string :opening_crawl
    string :url
  end
end
