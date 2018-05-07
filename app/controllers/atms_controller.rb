class AtmsController < ApplicationController
  before_action :set_atm_filter, only: :index

  def new
    @atm = Atm.new
  end

  def index
    @results = @atm_filter.perform if @atm_filter.valid?
  end

  def create
    @atm = Atm.new(atm_params)
    @atm.build_location(location_params)

    if @atm.save
      redirect_to home_path, notice: t('activerecord.notices.atm_cteated')
    else
      render :new
    end
  end

  private

  def atm_params
    params.require(:atm).permit(:id, :address)
  end

  def location_params
    params.require(:atm).require(:location).permit(:latitude, :longitude)
  end

  def filter_params
    return {} unless params[:filter]
    params.require(:filter).permit(:latitude, :longitude)
  end

  def set_atm_filter
    @atm_filter ||= AtmFilter.new(filter_params)
  end
end
