class YoutubeLink < Link
  belongs_to :linker,
    polymorphic: true
end
