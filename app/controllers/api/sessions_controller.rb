class Api::SessionsController < ApplicationController
    def create
      usuario = Usuario.find_by(email: params[:email])
      if usuario&.authenticate(params[:password])
        token = JsonWebToken.encode(usuario_id: usuario.id)
        render json: { token: token, usuario_id: usuario.id }, status: :ok
      else
        render json: { error: "Email o contraseña incorrectos" }, status: :unauthorized
      end
    end
   def destroy
      # Aquí podrías implementar la lógica para invalidar el token si estás usando una lista de tokens revocados
      render json: { message: "Sesión cerrada" }, status: :ok
    end
end
