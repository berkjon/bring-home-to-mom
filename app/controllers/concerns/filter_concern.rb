module FilterConcern
  extend ActiveSupport::Concern
  def process_filters(params)

    if (params[:filterData]['smoke'] == "")
      params[:filterData]['smoke'] = 'false'
    end

    if (params[:filterData]['religion'] == "")
      params[:filterData]['religion'] = nil
    end
    return params.to_hash['filterData']
  end

  def process_both_filter(params)
  end
end
