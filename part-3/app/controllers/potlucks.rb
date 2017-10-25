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
  @potluck.host = current_user
  if @potluck.save
    redirect "/potlucks/#{@potluck.id}"
  else
    @errors = @potluck.errors.full_messages
    erb :"/potlucks/new"
  end
end

get '/potlucks/:id' do
  authenticate!
  @success_boolean = params[:success]
  if @success_boolean == "true"
    @success = "You are now attending #{params[:dp]}!"
  end
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

post '/potlucks/:potluck_id/potluck_attendances' do
  ep @potluck = find_and_ensure(params[:potluck_id])
  @attendance = PotluckAttendance.new(dish: params[:dish], potluck: @potluck , user: current_user)
  authenticate!
  if @attendance.save
    redirect "/potlucks/#{@potluck.id}?success=true&dp=#{@potluck.name}"
  else
    @dish_errors = @attendance.errors.full_messages
    erb :"/potlucks/show"
  end
end
