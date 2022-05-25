module ApplicationHelper
  def active?(link)
    params[:controller] == link ? "active" : ""
  end
end
