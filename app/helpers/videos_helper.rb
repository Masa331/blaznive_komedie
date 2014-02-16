module VideosHelper
  def video_iframe(video)
    content_tag(:iframe, nil, { src: video.link.href,
                                height: 281,
                                width: 500,
                                allowfullscreen: '',
                                frameborder: 0 })
  end

  def video_meta(video)
    "#{ l(video.created_at, format: :default) } | Zařazeno u: #{ link_to video.comedy.bilingual_title, comedy_path(video.comedy) }".html_safe
  end
end
