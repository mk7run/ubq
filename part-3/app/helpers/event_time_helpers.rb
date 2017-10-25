module PotluckEventHelpers
  def time(datetime)
    datetime.strftime("%A %B %e, %Y")
  end
end

helpers PotluckEventHelpers
