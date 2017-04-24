class ApplicationController < ActionController::API
	
  def badRequest
    render :json => { :response =>"Invalid URL"}, :status => 400
  end

  def serverError
    render :json => { :response => "A server Error Occured"}, :status => 500
  end

end
