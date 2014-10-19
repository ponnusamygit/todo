class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  after_filter :set_csft_token_for_ng

  def set_csft_token_for_ng
  	cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def redirect_to_root
    if [root_url, new_user_session_url].include? request.url
      puts 'Got to go root_url'
    elsif request.env['HTTP_REFERER'] ==  new_user_session_url
      redirect_to root_url 
    end unless Rails.env.development?
  end

  protected
  	def verified_request?
  		super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  	end
end
