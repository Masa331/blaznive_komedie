module VideosHelper
  def video_iframe(video)
    content_tag(:iframe, nil, { src: video.youtube_link.uri,
                                height: 281,
                                width: 500,
                                allowfullscreen: '',
                                frameborder: 0 })
  end
end
