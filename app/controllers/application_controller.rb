class ApplicationController < ActionController::API
    before_action :authorize_request
    private
    def authorize_request
      header = request.headers["Authorization"]
      header = header.split(" ").last if header
      decoded = JsonWebToken.decode(header)
      @current_user = Usuario.find(decoded[:usuario_id]) if decoded
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      render json: { error: "No autorizado" }, status: :unauthorized
    end
end
