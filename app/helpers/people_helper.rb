# -*- encoding : utf-8 -*-
module PeopleHelper
  def show_avatar(person,style=:thumb)
    image_tag(person.avatar? ? person.avatar.url(style) : 'nobody60.png', alt: person.name)
  end

  def show_person_sex(person)
    content_tag(:strong,person.sex,class: person.male? ? 'blue' : 'red')
  end

  def show_person_age(person)
    person.birthday.blank? ? '' : "#{l person.birthday,format: :long}, #{person.age} #{Russian::p(person.age ,'год','года','лет')}"
  end

end
