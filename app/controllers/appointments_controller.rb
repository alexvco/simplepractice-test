class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]

  # GET /appointments
  def index
    # @appointments = Appointment.all
    @appointments = Appointment.includes(:customer, :physician).all

    api_response(payload: AppointmentSerializer.new(@appointments))
  end

  # GET /appointments/1
  def show
    render json: @appointment
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render json: @appointment, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      render json: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:start_datetime, :end_datetime, :customer_id, :physician_id)
    end

    # not using this atm, but this is how you can include relationships and select certain fields/attributes instead of all
    def index_options
      {
        include: [:customers, :physicians],
        fields: {
          appointment: [:start_datetime, :end_datetime],
          physican: [:first_name],
          customer: [:first_name]
        }
      }
    end
end
