module ComediesHelper
  def comedy_meta(comedy)
    [ comedy_stamp(comedy), comedy_comedy_link(comedy) ].compact.join(' | ').html_safe
  end

  def comedy_stamp(comedy)
    l(comedy.created_at)
  end

  def comedy_comedy_link(comedy)
    "Zařazeno v kategorii #{ link_to(comedy.category.title, list_comedies_path(search: { category_search: comedy.category.id })) }"
  end

  def next_comedy_link(comedy)
    link_to " ←   #{comedy.bilingual_title}", comedy_path(comedy), class: 'left'
  end

  def previous_comedy_link(comedy)
    link_to " #{comedy.bilingual_title} → ", comedy_path(comedy), class: 'right'
  end
end
