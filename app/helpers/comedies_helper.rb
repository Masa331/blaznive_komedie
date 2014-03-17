module ComediesHelper
  def comedy_meta(comedy)
    "#{ l(comedy.published_at, format: :default) } | Zařazeno v kategorii #{ link_to(comedy.category.title, list_comedies_path(search: { category_search: comedy.category.id })) }".html_safe
  end

  def next_comedy_link(comedy)
    link_to " ←   #{comedy.bilingual_title}", comedy_path(comedy), class: 'left'
  end

  def previous_comedy_link(comedy)
    link_to " #{comedy.bilingual_title} → ", comedy_path(comedy), class: 'right'
  end
end
