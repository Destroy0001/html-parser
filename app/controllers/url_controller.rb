class UrlController < ApplicationController
  include ParseHelper
  
  #parses a url and stores it to database
  def parse
    url = params[:url]
    print url
    if not url
      return badRequest()
    end
    
    #this is defined in ParseHelper concern
    parseUrl(url)
  end

  #shows all stored urls
  def show

    #this is defined in ParseHelper concern
    showUrl()
  end

end
