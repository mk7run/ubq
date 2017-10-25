module PotluckControllerHelper
  def find_and_ensure(id)
    potluck = Potluck.find_by(id: id)
    halt(404, erb(:"/not_authorized")) if potluck.nil?
    potluck
  end
end

helpers PotluckControllerHelper
