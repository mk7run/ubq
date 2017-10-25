get '/potlucks' do
  @delete_boolean = params[:delete]
  if @delete_boolean == "true"
    @delete = "#{params[:dp]} has been deleted!"
  end
  @upcoming_potlucks_events = Potluck.order(:starts_at)
  @current_potlucks = @upcoming_potlucks_events.current
  @potlucks = @upcoming_potlucks_events
  erb :"/potlucks/index"
end

get '/potlucks/new' do
  @potluck = Potluck.new
  authenticate!
  erb :"/potlucks/new"
end

post '/potlucks' do
  @potluck = Potluck.new(params[:potluck])
  authenticate!
  @potluck.host_id = current_user.id
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"/potlucks/new"
  end
end

get '/potlucks/:id' do
  authenticate!
  @potluck = find_and_ensure(params[:id])
  erb :"/potlucks/show"
end

get '/potlucks/:id/edit' do
  @potluck = find_and_ensure(params[:id])
  authenticate!
  authorize!(@potluck.host)
  erb :"/potlucks/edit"
end

put '/potlucks/:id' do
  @potluck = find_and_ensure(params[:id])
  authenticate!
  authorized?(@potluck.host)
  @potluck.assign_attributes(params[:potluck])

  if @potluck.save
    redirect "/potlucks/#{params[:id]}"
  else
    @errors = @potluck.errors.full_messages
    erb :'potlucks/edit'
  end
end

delete '/potlucks/:id' do
  @potluck = find_and_ensure(params[:id])
  authenticate!
  authorized?(@potluck.host)
  ep "authorized to delete"
  @potluck.destroy
  redirect "/potlucks?delete=true&dp=#{@potluck.name}"
end

