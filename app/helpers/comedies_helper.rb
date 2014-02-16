module ComediesHelper
  def comedy_meta(comedy)
    "#{ l(comedy.created_at, format: :default) } | Zařazeno v kategorii #{ comedy.category.title }"
  end
end
