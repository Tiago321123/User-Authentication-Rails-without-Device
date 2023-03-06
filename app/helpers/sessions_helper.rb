module SessionsHelper
    def sign_in(user)
        session[:user_id] = @user.id
    end
    # A partir de agora, através desse método o usuário está logando com um cookie temporário que expira ao fechar o browser. Mas, para chamar esse método em todos os controllers é preciso incluir o helper no ApplicationController.
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def block_access
            if current_user.present?
                    redirect_to users_path
            end
    end

    def logged_in?
        !current_user.nil? # é possível checar seu status de login, ou seja, se um usuário está logado o current_user não é nil.
    end

    def sign_out
        session.delete(:user_id)
        @current_user = nil
    end
    
end
