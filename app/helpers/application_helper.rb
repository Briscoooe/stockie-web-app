module ApplicationHelper
    def nav_item_is_active?(path)
        return current_page?(path) ? "navbar-item is-active" : "navbar-item"
    end
end
