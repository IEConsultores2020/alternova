class ChucknorrisController < ApplicationController
  before_action :authenticate_user!

  def index
    @chucknorris = Chucknorri.all
  end

  def new
    @chucknorri = Chucknorri.new
    get_joke
    @chucknorri.joke = @joke  
  end

  def create
    @chucknorri = Chucknorri.new(chucknorri_params)

    if params[:commit] == "Add Favorite"
      if @chucknorri.save
        #redirect_to @chucknorri
        redirect_to :action => 'index'
      else
        render 'new'
      end
    end 
  end

  def get_joke

    RestClient.get('https://api.chucknorris.io/jokes/random') {| response, request, result |
      if response.code == 200
        result = JSON.parse response.to_str
        @joke = result['value']
      else
        render html: {message: "I don't get a Joke, retry...", error: 404}
      end
        }
  end

private
  def chucknorri_params
    params.require(:chucknorri).permit(:joke)
  end  
end
