module ImagesHelper
  def image_tag_with_options(image)
    image_tag(image.image.url, class: 'th', alt: image.alt, title: image.title)
  end

  def image_meta(image)
    "#{ l(image.created_at, format: :default) } | Zařazeno u: #{ link_to(image.comedy.bilingual_title, comedy_path(image.comedy)) }".html_safe
  end
end
