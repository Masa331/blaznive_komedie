module ComediesHelper
  def next_comedy_link(comedy)
    link_to " ←   #{comedy.bilingual_title}", comedy_path(comedy), class: 'left'
  end

  def previous_comedy_link(comedy)
    link_to " #{comedy.bilingual_title} → ", comedy_path(comedy), class: 'right'
  end
end
