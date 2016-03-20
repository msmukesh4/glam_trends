class SalonsController < ApplicationController
  
  def index
    @salons = Salon.where(:status => "Active")
  end

  def edit
    @salon = Salon.new
  end

  def update
    @salon =  Salon.find(params[:id])
      if @salon.update_attributes(edit_salon_params)
         flash[:notice] = "salon updated successfully"
         redirect_to(:action => 'index', :id => @salon.id)
      else
        render('edit')
      end
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(new_salon_params) 
    @salon.uuid = gen_uuid
    if @salon.save
       flash[:notice] = "salon successfully saved"
       redirect_to(:action => 'index')
    else
       flash[:notice] = "salon creation unsuccessful"
       render('new')
    end
  end

  def show
    @salon = Salon.find(params[:id])
  end

  def delete
    @salon = Salon.find(params[:id])
  end

  def destroy
    salon = Salon.find(params[:id])
    salon.status = "Deactive"
    salon.save
    flash[:notice] = "salon #{salon.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def new_salon_params
      params.require.(:salon).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address)
    end

    def edit_salon_params
      params.require.(:salon).permit(:id, :name, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address, :status, :booking_count, :user_id)
    end
end
