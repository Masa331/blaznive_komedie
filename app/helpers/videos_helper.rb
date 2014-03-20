module VideosHelper
  def video_iframe(video)
    content_tag(:iframe, nil, { src: video.link.href,
                                height: 281,
                                width: 500,
                                allowfullscreen: '',
                                frameborder: 0 })
  end

  def video_meta(video)
    [ video_stamp(video), video_comedy_link(video) ].compact.join(' | ').html_safe
  end

  def video_stamp(video)
    l(video.created_at)
  end

  def video_comedy_link(video)
    if video.comedy
      "Zařazeno u: #{ link_to(video.comedy.bilingual_title, comedy_path(video.comedy)) }"
    end
  end
end
