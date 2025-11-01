class ApplicationController < ActionController::API
    def authorize_request
      header = request.headers["Authorization"]
      token = header.split(" ").last if header
      decoded = JsonWebToken.decode(token)
      @current_user = Usuario.find(decoded[:usuario_id])
    rescue
      render json: { errors: "No autorizado" }, status: :unauthorized
    end
end
