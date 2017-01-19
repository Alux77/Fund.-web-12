get '/' do
  @short_url = params[:short_url]
  @database = Url.all
  erb :index
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
end

post '/urls' do
  # @user_url = params[:url]

  @long_url = params[:url]
  # Url.create(:long_url => @user_url)
  # Url.create :long_url => @user_url
  @url = Url.create(long_url: @long_url, short_url: @short_url)

  if @url.save
    @short_url
  redirect to '/'
end
end

get '/urls' do
  # crea una nueva url 
end

# e.g., /q6bda
get '/:short_url' do
  url = Url.find_by(short_url:params[:short_url])
  url.increment(:click_count).save
  redirect to url.long_url
  # redirige a la URL original
end