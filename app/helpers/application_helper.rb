module ApplicationHelper
  def markdown
    Redcarpet::Markdown.new(renderer, {})
  end

  def video_iframe(video)
    content_tag(:iframe, nil, { src: video.youtube_link.uri,
                                height: 281,
                                width: 500,
                                allowfullscreen: '',
                                frameborder: 0 })
  end

  def tag_with_link(tag)
    content_tag :span, class: "label label-pill label-default" do
      link_to tag, search_results_path(search_term: tag)
    end
  end

  def alert_css_class(key)
    { "notice" => 'success',
      "alert" => 'danger'
    }.fetch(key, 'success')
  end

  private

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new({})
  end
end
