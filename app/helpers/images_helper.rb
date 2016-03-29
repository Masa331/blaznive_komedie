module ImagesHelper
  def image_tag_with_options(image)
    image_tag(image.image.url, class: 'th', alt: image.alt, title: image.title)
  end

  def image_meta(image)
    [ image_stamp(image), image_comedy_link(image) ].compact.join(' | ').html_safe
  end

  def image_stamp(image)
    l(image.created_at)
  end

  def image_comedy_link(image)
    if image.comedy
      "Zařazeno u: #{ link_to(image.comedy.bilingual_title, comedy_path(image.comedy)) }"
    end
  end
end
