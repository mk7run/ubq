module PotluckEventControllerHelper
  def find_dish(event)
    potluckrsvp = PotluckAttendance.find_by(potluck_id: event.id)
    potluckrsvp.dish
  end
end

helpers PotluckEventControllerHelper
