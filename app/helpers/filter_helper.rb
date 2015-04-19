module FilterHelper
  def format_gender(interest)
    if interest == "women"
      return "female"
    elsif interest == "men"
      return "male"
    else
      return interest
    end
  end
end
