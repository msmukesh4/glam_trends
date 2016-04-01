class SpasController < ApplicationController

  before_action :confirm_logged_in
  # load_and_authorize_resource
  layout "admin_home", only: [:index, :show, :edit, :new, :delete]

  def index
    @spas = Spa.all
  end

  def edit
    @spa = Spa.find(params[:id])
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
    puts "================================================================" 
    puts @spa.inspect
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
      params.require(:spa).permit(:id, :uuid, :name, :user_id, :status ,:icon, :banner, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2, :location_id, :latitide, :logitude, :caption, :details, :address, :booking_count, :offer_id)
    end

    def edit_spa_params
      params.require(:spa).permit(:name, :icon, :banner, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address, :status, :booking_count, :user_id)
    end
end
