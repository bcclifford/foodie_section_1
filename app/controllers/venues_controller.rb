class VenuesController < ApplicationController
  def index
    @q = Venue.ransack(params[:q])
    @venues = @q.result(:distinct => true).includes(:favorites, :neighborhood, :dishes).page(params[:page]).per(10)

    render("venue_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @venue = Venue.find(params.fetch("id_to_display"))

    render("venue_templates/show.html.erb")
  end

  def new_form
    @venue = Venue.new

    render("venue_templates/new_form.html.erb")
  end

  def create_row
    @venue = Venue.new

    @venue.address = params.fetch("address")
    @venue.neighborhood_id = params.fetch("neighborhood_id")
    @venue.name = params.fetch("name")

    if @venue.valid?
      @venue.save

      redirect_back(:fallback_location => "/venues", :notice => "Venue created successfully.")
    else
      render("venue_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_neighborhood
    @venue = Venue.new

    @venue.address = params.fetch("address")
    @venue.neighborhood_id = params.fetch("neighborhood_id")
    @venue.name = params.fetch("name")

    if @venue.valid?
      @venue.save

      redirect_to("/neighborhoods/#{@venue.neighborhood_id}", notice: "Venue created successfully.")
    else
      render("venue_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @venue = Venue.find(params.fetch("prefill_with_id"))

    render("venue_templates/edit_form.html.erb")
  end

  def update_row
    @venue = Venue.find(params.fetch("id_to_modify"))

    @venue.address = params.fetch("address")
    @venue.neighborhood_id = params.fetch("neighborhood_id")
    @venue.name = params.fetch("name")

    if @venue.valid?
      @venue.save

      redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
    else
      render("venue_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_neighborhood
    @venue = Venue.find(params.fetch("id_to_remove"))

    @venue.destroy

    redirect_to("/neighborhoods/#{@venue.neighborhood_id}", notice: "Venue deleted successfully.")
  end

  def destroy_row
    @venue = Venue.find(params.fetch("id_to_remove"))

    @venue.destroy

    redirect_to("/venues", :notice => "Venue deleted successfully.")
  end
end
