module ApplicationHelper
  def title(title)
    content_for(:title) { "Bláznivé komedie | #{title}"}
  end

  def markdown
    Redcarpet::Markdown.new(renderer, {})
  end

  def admin_area(&block)
    yield if admin_signed_in?
  end

  private

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new({})
  end
end
