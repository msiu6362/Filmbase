# -*- encoding : utf-8 -*-
module ApplicationHelper

  def copyright_years
    start=2012
    year=Time.now.year
    start==year ? start : "#{start}&ndash;#{year}".html_safe
  end

  def link_to_icon(icon,text,*args)
    link_to(content_tag(:i,nil,:class=>icon)+text,*args)
  end

  def error_messages_for(object)
    render 'layouts/error_messages', object: object
  end

  def admin?
    logged_in? && current_user.admin?
  end
end
