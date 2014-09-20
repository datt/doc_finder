module ClinicsHelper
  def hidden_days(availabilities)
    days = availabilities.map{|d| d[:day]}
    available_days =
      days.map do |day|
        Date::DAYNAMES.index(day)
      end
    disable_days = [*0..6] - available_days
    disable_days
  end
end
