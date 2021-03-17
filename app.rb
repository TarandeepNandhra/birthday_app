require 'sinatra'
# require_relative "./lib/counter"  for the code file

class Birthday < Sinatra::Base
  # before do
  #   @counter = Counter.instance
  # end
  get '/' do
    erb(:index)
  end
  
  post '/birthday' do
    @name = params[:name]
    @day = params[:day]
    @month = params[:month]
    actual_month = Time.now.month
    actual_day = Time.now.day

    return erb(:birthday) if actual_day == @day.to_i && 
    actual_month == @month.to_i

    # Better to create two date objects and subtract dates
    # Returns a rational class object -> .numerator .denominator

    @month = actual_month - @month.to_i
    
    @month = - @month.to_i if @month.to_i < 0 
    @day = 30 - @days.to_i if @month.to_i > 0

    erb(:notbday)
  end
end



