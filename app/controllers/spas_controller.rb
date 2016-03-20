class SpasController < ApplicationController

  layout "admin_home", only: [:index, :show, :edit, :new]

  def index
    @spas = Spa.where(:status => "Active")
  end

  def edit
    @spa = Spa.new
  end

  def update
    @spa =  Spa.find(params[:id])
      if @spa.update_attributes(edit_spa_params)
         flash[:notice] = "Spa updated successfully"
         redirect_to(:action => 'index', :id => @spa.id)
      else
        render('edit')
      end
  end

  def new
    @spa = Spa.new
  end

  def create
    @spa = Spa.new(new_spa_params) 
    @spa.uuid = gen_uuid
    if @spa.save
       flash[:notice] = "Spa successfully saved"
       redirect_to(:action => 'index')
    else
       flash[:notice] = "Spa creation unsuccessful"
       render('new')
    end
  end

  def show
    @spa = Spa.find(params[:id])
  end

  def delete
    @spa = Spa.find(params[:id])
  end

  def destroy
    spa = Spa.find(params[:id])
    spa.status = "Deactive"
    spa.save
    flash[:notice] = "Spa #{spa.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def new_spa_params
      params.require.(:spa).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address)
    end

    def edit_spa_params
      params.require.(:spa).permit(:id, :name, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address, :status, :booking_count, :user_id)
    end
end
