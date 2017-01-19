class Url < ActiveRecord::Base
  # Remember to create a migration!
  include ActiveModel::Validations

  before_create :create_short_url
  validates :long_url, :presence => true

  def method_name
    validates_format_of :uri, :with => URI.regexp(['http'])
  end
  # validates_format_of :domain_name, :with => /A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?z/ix
  # # validates :long_url, format: => URI::regexp(%w(http https))
  
  def create_short_url
    array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
    self.short_url = array
  end
end