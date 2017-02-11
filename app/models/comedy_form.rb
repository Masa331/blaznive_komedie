class ComedyForm
  include ActiveModel::Model

  attr_accessor :comedy

  delegate :cz_title, :cz_title=, :en_title, :en_title=, :text, :text=, :tag_list, :tag_list=, to: :comedy
  delegate :title, :title=, :image, :image=, to: :image, prefix: true
  delegate :title, :title=, to: :video, prefix: true
  delegate :uri, :uri=, to: :youtube_link, prefix: true

  def save
    if comedy.valid? && image.valid? && video.valid? && youtube_link.valid?
      comedy.save &&
        image.save &&
        video.save &&
        youtube_link.update(linker_type: 'Video', linker_id: video.id)
    end
  end

  def comedy
    @comedy ||= Comedy.new
  end

  def image
    @image ||= comedy.image || comedy.build_image
  end

  def video
    @video ||= comedy.video || comedy.build_video
  end

  def youtube_link
    @youtube_link ||= video.youtube_link || video.build_youtube_link
  end
end
