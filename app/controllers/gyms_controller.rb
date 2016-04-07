class GymsController < ApplicationController
  
  before_action :confirm_logged_in
  layout "admin_home", only: [:index, :show, :edit, :new, :delete]

  def index
    @gyms = Gym.all
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym =  Gym.find(params[:id])
      if @gym.update_attributes(edit_gym_params)
        flash[:notice] = "gym updated successfully"
        redirect_to(:action => 'index', :id => @gym.id)
      else
        render('edit')
      end
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(new_gym_params)
    @gym.uuid = gen_uuid
    if @gym.save
       flash[:notice] = "gym successfully saved"
       redirect_to(:action => 'index')
    else
       flash[:notice] = "gym creation unsuccessful"
       render('new')
    end
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def delete
    @gym = Gym.find(params[:id])
  end

  def destroy
    gym = Gym.find(params[:id])
    gym.status = "Deactive"
    gym.save
    flash[:notice] = "gym #{gym.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
    def new_gym_params
      params.require(:gym).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address)
    end

    def edit_gym_params
      params.require(:gym).permit(:id, :name, :icon, :banner, :uuid, :service_type_ids, :time_slot_ids, :contact_number1, :contact_number2,:location_id,:latitide, :logitude, :caption, :details, :address, :status, :booking_count, :user_id)
    end
end
