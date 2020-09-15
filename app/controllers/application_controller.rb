class ApplicationController < ActionController::API
  def api_response(payload: {}, status: :ok)
    render json: payload.try(:serializable_hash) || payload, status: status
  end
end
