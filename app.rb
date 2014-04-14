# app.rb

require 'sinatra'
require 'sinatra/activerecord'
# require './environments'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require 'json'

enable :sessions

db = URI.parse('postgres://localhost:5321/dkprecisiondev')

ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )


class Post < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
# 
# helpers do
#   def title
#     if @title
#       "#{@title}"
#     else
#       "Welcome."
#     end
#   end
# end
# 
# get ALL posts
get "/" do
  @posts = Post.order("created_at DESC")
  @title = "Welcome."
  content_type :json
  return {:sushi => ["Maguro", "Hamachi", "Uni", "Saba", "Ebi", "Sake", "Tai"]}.to_json
  # erb :"posts/index"
end
# 
# # create new post
# get "/posts/create" do
#   @title = "Create post"
#   @post = Post.new
#   erb :"posts/create"
# end
# 
# post "/posts" do
#   @post = Post.new(params[:post])
#   if @post.save
#     redirect "posts/#{@post.id}", :notice => 'Congrats! Love the new post. (This message will disapear in 4 seconds.)'
#   else
#     redirect "posts/create", :error => 'Something went wrong. Try again. (This message will disapear in 4 seconds.)'
#   end
# end
# 
# # view post
# get "/posts/:id" do
#   @post = Post.find(params[:id])
#   @title = @post.title
#   erb :"posts/view"
# end
# 
# # edit post
# get "/posts/:id/edit" do
#   @post = Post.find(params[:id])
#   @title = "Edit Form"
#   erb :"posts/edit"
# end
# 
# put "/posts/:id" do
#   @post = Post.find(params[:id])
#   @post.update(params[:post])
#   redirect "/posts/#{@post.id}"
# end