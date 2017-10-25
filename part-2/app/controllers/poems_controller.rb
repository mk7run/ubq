get "/poems" do
  @poems = Poem.recent
  erb :"/poems/index"
end

post "/poems" do
  @poem = Poem.new(params[:poem])
  if request.xhr?
    if @poem.save
      erb :"/poems/_poem", layout: false, locals: {poem: @poem}
    else
      status 422
    end
  else
    if @poem.save
        redirect "/poems/#{@poem.id}"
    else
      @errors = @poem.errors.values.flatten
      erb :"/poems/new"
    end
  end
end

put "/poems/:id/applauses" do
  poem = Poem.find(params[:id])
  poem.increment!(:applauses)
  redirect "/poems/#{poem.id}"
end

get "/poems/new" do
  erb :"/poems/new"
end

get "/poems/:id" do
  @poem = Poem.find(params[:id])
  erb :"/poems/show"
end
