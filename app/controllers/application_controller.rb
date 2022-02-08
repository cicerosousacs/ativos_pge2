class ApplicationController < ActionController::Base
    layout :layout_ativos

    
    
    protected

    def layout_ativos
        if devise_controller? && resource_class == Admin
            "admins_session"
        else
            "application"
        end
    end
end
