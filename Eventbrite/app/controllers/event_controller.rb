class EventController < ApplicationController
 
  def index
    @events = Event.all
    # <p class="card-text"><%= @users_event.first_name %></p>
  end

  def new
    @event = Event.new
    @user_id = current_user.id
  end

  def create
    event_params = params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price , :user_id)
    @event = Event.new(event_params)
    puts @event
    if (@event.save)

      redirect_to event_path(@event.id), :flash => {:success => "Vous avez bien cree l'event"} and return
    else
      flash[:error] = "Create event not working. #{@event.errors.full_messages}"
      render new_event_path and return
    end
  end

  
  def show
    @event = Event.all.find(params[:id])
    @attendances = Attendance.all
    puts @attendances
    puts "*"*60
    puts @attendances
  end

  # <% if @attendances.user_id.count %>
  #   <p>Nombre de participant : <%= @attendances.user_id.count%></p>
  #   <% end%>
  
  def destroy
    @event = Event.all.find(params[:id])
    @event.delete
    redirect_to root_path, :flash => {:success => "Vous avez bien delete le gossip"} and return
  end
  
  def edit
    @event = Event.all.find(params[:id])
  end

  def update
    @event = Event.all.find(params[:id])
    event_params = params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price )
    @event.update(event_params, user_id: current_user.id)
  end

  # def subscribe
  #   puts "-"*60
  #   puts "start"
  #   puts "-"*60
  #   @event = Event.all.find(params[:id])
  #   # if @event.user_id.include? current_user
  #   #   flash[:error] = "Vous participez deja a l'evenement."
  #   #   redirect_to "#", show_path and return
  #   # end
    
  #   @amount = @event.price
  #   customer = Stripe::Customer.create({
  #     email: params[:stripeEmail],
  #     source: params[:stripeToken],
  #   })
  
  #   charge = Stripe::Charge.create({
  #     customer: customer.id,
  #     amount: @amount,
  #     description: 'Paiement du client',
  #     currency: 'eur',
  #   })
  
  #   # @event.user_id << current_user
  #   # flash[:success] = "Vous etes inscrit a l'evenement"
  #   # redirect_to event_path and return
  
  # # rescue Stripe::CardError => e
  # #   flash[:error] = e.message
  # #   redirect_to new_charge_path
  # # end
  # puts "/"*60
  #   puts "end"
  #   puts "/"*60
  # end

 
end



# <%= form_tag subscribe_event_path(@event.id) do %>
#   <article>
#       <% if flash[:error].present? %>
#       <div id="error_explanation">
#           <p><%= flash[:error] %></p>
#       </div>
#       <% end %>
#       <label class="amount">
#       <p>Veuillez payez le montant de: <%= @event.price.to_f / 100  %>euro de pour l'inscription</p>
#       </label>
#   </article>

#   <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
#           data-key="<%= Rails.configuration.stripe[:publishable_key] %>"
#           data-description="A month's subscription"
#           data-amount=<%= @event.price %>
#           data-currency= "eur"
#           data-locale="auto">
#   </script>
# <% end %>