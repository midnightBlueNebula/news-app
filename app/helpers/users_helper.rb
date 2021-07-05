module UsersHelper
    def login(user)
        session[:user_id] = user.id
    end

    def logout
        session.delete(:user_id)
        forget current_user
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def current_user
        if session[:user_id]
            @curent_user ||= User.find_by(id: session[:user_id])
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    def current_user?(user)
        user == current_user
    end

    def logged_in?
        !current_user.nil?
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
