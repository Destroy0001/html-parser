require 'open-uri'
class UrlController < ApplicationController
  def parse
    url = params[:url]
    html = Nokogiri::HTML(open(url))
    h1List = html.css('h1').each{|h1| print h1}
    h2List = html.css('h2').each{|h2| print h2}
    h3List = html.css('h3').each{|h3| print h3}
  end

  def show

  end
end
