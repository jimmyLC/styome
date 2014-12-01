class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_reqired
    current_user && current_user.admin?
  end

  helper_method :admin_reqired
  helper_method :current_cart
  around_action :setup_cart

  def current_cart
    @cart
  end

  def setup_cart
    if session[:cart]
      @cart = Marshal::load(session[:cart])
    else
      @cart = Cart.new
    end

    yield #why????

    session[:cart] = Marshal::dump(@cart)
  end


end
