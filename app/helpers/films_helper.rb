# -*- encoding : utf-8 -*-
module FilmsHelper
  def show_cover(film, style=:thumb)
    image_tag(film.cover? ? film.cover.url(style) : 'film60.png', alt: film.name)
  end

  def show_film_info(film)
    res=[]
    c=film.country
    g=film.genre
    res << link_to(g.name,g) if g
    res << link_to(c.name, c) if c
    res << film.year unless film.year.blank?
    raw res.join(', ')
  end

  def show_video(uri)
    content_tag(:iframe,nil, width: 570, height:390, src: "http://youtube.com/embed/#{uri}", allow_fullscreen: true)
  end
end
