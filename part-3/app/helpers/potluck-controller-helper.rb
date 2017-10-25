module PotluckControllerHelper
  def find_and_ensure(id)
    potluck = Potluck.find_by(potluck_id: id)
    halt(404, erb(:'404')) if potluck.nil?
    potluck
  end
end

helpers PotluckControllerHelper
