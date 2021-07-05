module ApplicationHelper
    def back_or_root(url = root_url)
        redirect_back(fallback_location: url)
    end
end
