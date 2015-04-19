class FilterController < ApplicationController
  include FilterConcern

  def filter_matches

    params[:filterData].delete('gender') if params[:filterData]['gender'] == "both"
    child_gender = params[:filterData]['childGender']
    params[:filterData].delete('childGender')
    matches = Child.where(process_filters(params))

    nonincestual_matches = matches.select{|child| child.parent != current_user}

    same_orientation = nonincestual_matches.select{|child| child.sexual_preference = child_gender}

    render json: {matches: nonincestual_matches}
  end
end
