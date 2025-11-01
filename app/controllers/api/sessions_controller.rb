class Api::SessionsController < ApplicationController
    def create
      usuario = Usuario.find_by(email: params[:email])
      if usuario&.authenticate(params[:password])
        token = JsonWebToken.encode(usuario_id: usuario.id)
        render json: { token: token }, status: :ok
      else
        render json: { error: "Email o contraseña incorrectos" }, status: :unauthorized
      end
    end
end
