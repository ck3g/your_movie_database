module ApplicationHelper
  def show_top_navbar?
    !%w(welcome registrations sessions).include?(controller_name)
  end

  def nav_bar_link(title, path)
    content_tag :li, class: "nav-item #{"active" if current_page?(path)}" do
      link_to title, path, class: "nav-link"
    end
  end
end
