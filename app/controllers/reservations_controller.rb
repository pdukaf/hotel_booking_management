class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def edit
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:hotel_name, :price, :currency, :arrival_date, :departure_date, :guest_name, :guest_email)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
