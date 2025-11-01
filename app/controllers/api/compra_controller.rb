class Api::PublicacionesController < ApplicationController
    before_action :authorize_request, only: [ :create ]
    def index
      publicaciones = Publicacion.includes(:carta, :usuario).all
      render json: publicaciones.as_json(include: [ :carta, :usuario ])
    end
    def create
      publicacion = @current_user.publicaciones.new(publicacion_params)
      if publicacion.save
        render json: publicacion, status: :created
      else
        render json: { errors: publicacion.errors.full_messages }, status: :unprocessable_entity
      end
    end
    private
    def publicacion_params
      params.require(:publicacion).permit(:carta_id, :precio)
    end
end
