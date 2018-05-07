module AtmsHelper
  def rounded_value(value)
    value.round(2)
  end

  def search_results_header
    I18n.t(
      'activerecord.attributes.atm.search_results',
      distance: Atm::DISTANCE_THRESHOLD,
      qty: @results.size
    )
  end
end
