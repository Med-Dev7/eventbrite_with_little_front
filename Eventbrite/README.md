# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.all.find(params[:id])
    @user.update(@user_params)
    redirect_to user_show_path, :flash => {:success => "Vous bien update le gossip"} and return

    
    # person = current_account.people.find(params[:id])
    # person.update!(person_params)
    # redirect_to person
    
    # @first_name = params[:first_name]
    # @last_name = params[:last_name]
    # @description = params[:description]
    # @user.update(first_name: @first_name,last_name: @last_name,description: @description )
  end


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
controlleur




view
<h1>User#edit</h1>
<p>Find me in app/views/user/edit.html.erb</p>
<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <br><br><br>
      <% form_tag user_update_path, :method => :put, class: "form-signin mt-3" do %>
        <h1 class="h3 mb-3 font-weight-normal text-center">Edit profile</h1>
        <div class="form-group">
          <%= f.label :first_name, "first_name" %><br />
           <%= f.text_field :first_name,  autofocus: true,  class: "form-control" %>
          
        </div>
        <div class="form-group">
        <%= f.label :last_name, "last_name" %><br />
           <%= f.text_field :last_name,  autofocus: true,  class: "form-control" %>
        </div>

            <div class="form-group">
        <%= f.label :description, "description" %><br />
           <%= f.text_field :description,  autofocus: true,  class: "form-control" %>
        </div>

        <div class="actions mt-5">
          <%= f.submit "Edit", class: "btn btn-lg btn-primary btn-block" %>
        </div>
      <% end %>
      <%= render "devise/shared/links" %>
    </div>
  </div>
</div>



<h1>User#show</h1>
<p>Find me in app/views/user/show.html.erb</p>
<%= link_to "edit profil", edit_user_path, :class => "nav-link" %>
<%= link_to "edit compte", edit_user_registration_path(@user.id), :class => "nav-link" %>
<p><%= @user.first_name%></p>
<p><%= @user.last_name%></p>
<p> <%= @user.description%></p>
<p> <%= @user.email%></p>
<p> <%= @user.event_id%></p>

<h1>User#update</h1>
<p>Find me in app/views/user/update.html.erb</p>
