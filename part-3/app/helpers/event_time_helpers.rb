module PotluckEventHelpers
  def date(datetime)
    datetime.strftime("%A %B %e, %Y")
  end

  def time(datetime)
    datetime.strftime("%l:%M %P")
  end
end

helpers PotluckEventHelpers
