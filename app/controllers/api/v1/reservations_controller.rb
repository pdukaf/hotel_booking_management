module Api
  module V1
    class ReservationsController < ApiController
      before_action :set_reservation, only: %i[ show update destroy ]
      def index
        reservations = Reservation.all

        render locals: { reservations: reservations }
      end

      def show
        render :show, locals: { reservation: @reservation }
      end

      def create
        reservation = Reservation.new(reservation_params)
        if reservation.save
          render :show, locals: { reservation: reservation }
        else
          render json: reservation.errors, status: :unprocessable_entity
        end
      end

      def update
        if @reservation.update(reservation_params)
          render :show, locals: { reservation: @reservation }
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @reservation.destroy!

        head :no_content
      end

      private

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(
          %i(hotel_name price currency arrival_date departure_date guest_name guest_email)
        )
      end
    end
  end
end