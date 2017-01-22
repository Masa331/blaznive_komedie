class ComedyForm
  include ActiveModel::Model

  attr_accessor :cz_title, :en_title, :text, :tag_list, :image_title, :uploaded_image, :video_title, :video_link

  def save
    if comedy.valid? && image.valid? && video.valid? && youtube_link.valid?
      comedy.save && image.save && video.save && youtube_link.update(linker_id: video.id)
    end
  end

  def comedy
    @comedy ||= Comedy.new(cz_title: cz_title, en_title: en_title, text: text, tag_list: tag_list)
  end

  def image
    @image ||= Image.new(comedy: comedy, title: image_title, image: uploaded_image)
  end

  def video
    @video ||= Video.new(title: video_title, comedy: comedy)
  end

  def youtube_link
    @youtube_link ||= YoutubeLink.new(uri: video_link, linker_type: 'Video')
  end
end
