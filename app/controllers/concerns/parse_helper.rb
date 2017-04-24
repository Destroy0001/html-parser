require 'open-uri'
module ParseHelper
  extend ActiveSupport::Concern

  #parses a url, and then returns, the specified elements 
  def parseUrl(url)
    begin
      #parse html error
      html = Nokogiri::HTML(open(url))
    rescue
      #if the page wasn't parsed return a server error 
      return serverError()
    end

    #parsing different elements from the html page
    h1List = html.css('h1').map{ |h1| h1.inner_html }
    h2List = html.css('h2').map{ |h2| h2.inner_html }
    h3List = html.css('h3').map{ |h3| h3.inner_html }
    links = html.css('a').map{ |link| link['href'] }

    recordUrl = Url.where(:url => url).first

    #if the url doesn't exist, create it, else update it. 
    if recordUrl.nil?
      recordUrl = Url.new(url: url, h1: h1List, h2: h2List, h3: h3List, links: links)
    else
      recordUrl.update(h1: h1List, h2: h2List, h3: h3List, links: links)
    end
    recordUrl.save

    #returning a success response
    render :json => { :response => url + " was parsed sucessfully" }, :status => 200
  end

  #shows all stores urls 
  def showUrl()
    #fetching all records, and then removing the _id key,
    #inbuilt project methods don't filter the _id field
    recordUrls = Url.all.map{
      |url| { 
        :url => url.url,
        :h1 => url.h1,
        :h2 => url.h2,
        :h3=> url.h3,
        :links => url.links 
      }
    }
    render :json => { :response => recordUrls }, :status =>200
  end

end