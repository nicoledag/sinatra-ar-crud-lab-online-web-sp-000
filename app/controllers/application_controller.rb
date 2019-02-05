
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    Article.create(title: params[:title], content: params[:content])

    redirect to "/articles/#{Article.last.id}"
    #redirects to articles/id and shows the last article inputted.
  end

  get '/articles' do
    @articles = Article.all
    #index erb: Iterate through the @articles variable and show the title and content for all articles.

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    #show erb: shows the title and content for a particular id.

    erb :show
  end

  get '/articles/:id/edit' do
    @article2 = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    article = Article.find(params[:id])
    article.name = params[:name]
    article.content = params[:content]
    article.save

    redirect to "/articles/#{Article.last.id}"
  end


end
