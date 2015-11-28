class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_render(*args)
    if params[:spf] == 'navigate'
      render "#{controller_name}/spf_#{action_name}.json"
    else
      super
    end
  end

end
