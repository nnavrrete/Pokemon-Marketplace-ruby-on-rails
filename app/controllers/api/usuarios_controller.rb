class Api::UsuariosController < ApplicationController
    def index
      usuarios = Usuario.select(:id, :nombre, :email)
      render json: usuarios
    end

    def create
      usuario = Usuario.new(usuario_params)
      if usuario.save
        render json: usuario, status: :created
      else
        render json: { errors: usuario.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
        usuario = Usuario.find(params[:id])
        if usuario.update(usuario_params)
            render json: usuario, status: :ok
        else
            render json: { errors: usuario.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        usuario = Usuario.find(params[:id])
        usuario.destroy
        render json: { message: "Usuario eliminado" }, status: :ok
    end

    private

    def usuario_params
      params.require(:usuario).permit(:nombre, :email, :password)
    end
end
