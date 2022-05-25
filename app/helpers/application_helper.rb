module ApplicationHelper
  def active?(link)
    params[:controller] == link ? "active" : ""
  end

  def safe_html(string)
    string.html_safe
  end
end
