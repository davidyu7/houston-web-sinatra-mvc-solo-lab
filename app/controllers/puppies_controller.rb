class PuppiesController < ApplicationController
    get '/' do
       @puppies = Puppy.all
       erb :index
   end

   get '/puppy/:id' do
        @puppy = Puppy.find(params[:id])
        erb :display_puppy
   end

   post '/puppy' do
        Puppy.create(name: params[:name], breed: params[:breed])
        redirect to('/')
   end

   patch '/puppy/:id' do
        @puppy = Puppy.find(params[:id])
        @puppy.update(name: params[:name], breed: params[:breed])
        redirect to("/puppy/#{@puppy.id}")
   end

   delete '/puppy/:id' do
        @puppy = Puppy.find(params[:id])
        @puppy.destroy
        redirect to('/')
   end
        
        
end