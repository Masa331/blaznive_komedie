module ApplicationHelper
  def page_title(title = nil)
    [ "Bláznivé komedie", title ].compact.join(' | ')
  end

  def merge_to_default_keywords(keywords = nil)
    ([ 'komedie', 'zábava' ] << keywords).join(', ')
  end

  def markdown
    Redcarpet::Markdown.new(renderer, {})
  end

  private

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new({})
  end
end
