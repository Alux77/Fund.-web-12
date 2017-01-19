require 'securerandom'

def random_chars_generator
  array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
end

 def new_url
    array = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
   p "http://alux_urls/#{array}"
  end

  new_url