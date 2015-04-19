class FilterController < ApplicationController
  include FilterConcern

  def filter_matches
    #refactor this by initializing hash with smoke = false and religion = nil
    matches = Child.where(process_filters(params))
    match_ids = matches.map{|child| child.id}
    render json: {match_ids: match_ids}
  end
end