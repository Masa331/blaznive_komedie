module ApplicationHelper
  def markdown
    Redcarpet::Markdown.new(renderer, {})
  end

  private

  def renderer
    @renderer ||= Redcarpet::Render::HTML.new({})
  end
end
