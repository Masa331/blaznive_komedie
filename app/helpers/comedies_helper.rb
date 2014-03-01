module ComediesHelper
  def comedy_meta(comedy)
    "#{ l(comedy.created_at, format: :default) } | Zařazeno v kategorii #{ link_to(comedy.category.title, list_comedies_path(search: { category_search: comedy.category.id })) }".html_safe
  end
end
