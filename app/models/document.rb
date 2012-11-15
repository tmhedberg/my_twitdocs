class Document
  include Mongoid::Document

  field :name, type: String
  field :size, type: Integer
  field :attrs, type: Hash, default: {}

  attr_accessible :name, :size, :attrs

  belongs_to :user

  # Document type is equal to its filename extension, or nil if no '.' occurs
  # in the filename
  def type
    m = name.match /.*\.(.*)/
    m.nil? ? nil : m[1]
  end
end
