class SportCentresController < ApplicationController
  def index
    @sport_centres = SportCentre.where(:status => "Active")
  end

  def edit
    @sport_centre = SportCentre.new
  end

  def update
    @sport_centre =  SportCentre.find(params[:id])
      if @sport_centre.update_attributes(edit_sport_centre_params)
         flash[:notice] = "sport_centre updated successfully"
         redirect_to(:action => 'index', :id => @sport_centre.id)
      else
        render('edit')
      end
  end

  def new
    @sport_centre = SportCentre.new
  end

  def create
    @sport_centre = SportCentre.new(new_sport_centre_params) 
    @sport_centre.uuid = gen_uuid
    if @sport_centre.save
       flash[:notice] = "sport_centre successfully saved"
       redirect_to(:action => 'index')
    else
       flash[:notice] = "sport_centre creation unsuccessful"
       render('new')
    end
  end

  def show
    @sport_centre = SportCentre.find(params[:id])
  end

  def delete
    @sport_centre = SportCentre.find(params[:id])
  end

  def destroy
    sport_centre = SportCentre.find(params[:id])
    sport_centre.status = "Deactive"
    sport_centre.save
    flash[:notice] = "sport_centre #{sport_centre.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def new_sport_centre_params
      params.require.(:sport_centre).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address)
    end

    def edit_sport_centre_params
      params.require.(:sport_centre).permit(:id, :name, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address, :status, :booking_count, :user_id)
    end
end
