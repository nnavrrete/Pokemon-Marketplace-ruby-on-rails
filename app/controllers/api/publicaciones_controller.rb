class Api::PublicacionesController < ApplicationController
    before_action :set_publicacion, only: [ :show, :destroy ]

    # GET /api/publicaciones
    def index
      publicaciones = Publicacion.includes(:usuario, :carta).all
      render json: publicaciones.as_json(
        include: {
          usuario: { only: [ :id, :nombre, :email ] },
          carta: { only: [ :id, :nombre, :tipo, :rareza, :imagen_url ] }
        },
        only: [ :id, :precio, :created_at ]
      )
    end

    # GET /api/publicaciones/:id
    def show
      render json: @publicacion.as_json(
        include: {
          usuario: { only: [ :id, :nombre, :email ] },
          carta: { only: [ :id, :nombre, :tipo, :rareza, :imagen_url ] }
        }
      )
    end

    # POST /api/publicaciones
    def create
      publicacion = Publicacion.new(publicacion_params)

      if publicacion.save
        render json: publicacion, status: :created
      else
        render json: { errors: publicacion.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # DELETE /api/publicaciones/:id
    def destroy
      @publicacion.destroy
      head :no_content
    end

    private

    def set_publicacion
      @publicacion = Publicacion.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Publicación no encontrada" }, status: :not_found
    end

    def publicacion_params
      params.require(:publicacion).permit(:usuario_id, :carta_id, :precio, :estado)
    end
end
