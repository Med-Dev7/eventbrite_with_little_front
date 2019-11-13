class AttendanceController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @event = Event.all.find(params[:event_id])
    @attendances = Attendance.where(event_id: [@event.id]) 
    @users =  User.where(id: [@attendances.ids])    
  end

  def new
    @event = Event.all.find(params[:event_id])
    @attendances = Attendance.new
    @user = current_user
  end

  def create
    puts "-"*60
    puts "start"
    puts "-"*60
    
    @event = Event.all.find(params[:id])
    if @event.user_id.include? current_user.id
      flash[:error] = "Vous participez deja a l'evenement."
      redirect_to show_path and return
    end
    @amount = @event.price
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Paiement du client',
      currency: 'eur',
    })
  
    @event.user_id << current_user
    @attendances.strip_customer_id
    flash[:success] = "Vous etes inscrit a l'evenement"
    redirect_to event_path and return
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    puts "/"*60
    puts "end"
    puts "/"*60
  end




    
      private

  def authenticate_user
    @event = Event.all.find(params[:event_id])
    if current_user.id != @event.user_id
      flash[:danger] = "Please log in."
      redirect_back(fallback_location: event_path(@event.id))
      # redirect_to event_path.(@event.id) and return
    end
  end


end
