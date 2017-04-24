class Url
  include Mongoid::Document
  field :url, type: String
  field :h1, type: Array
  field :h2, type: Array
  field :h3, type: Array
  field :links, type: Array
end
