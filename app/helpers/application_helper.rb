module ApplicationHelper
  def show_top_navbar?
    !%w(welcome registrations sessions).include?(controller_name)
  end
end
