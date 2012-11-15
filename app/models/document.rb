class Document
  include Mongoid::Document

  field :name, type: String
  field :size, type: Integer

  attr_accessible :name, :size
end
