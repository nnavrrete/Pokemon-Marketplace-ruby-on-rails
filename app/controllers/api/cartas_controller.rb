class Api::CartasController < ApplicationController
    # GET /api/cartas
    def index
      cartas = Carta.all
      render json: cartas
    end

    # GET /api/cartas/:id
    def show
      carta = Carta.find(params[:id])
      render json: carta
    end

    # POST /api/cartas
    def create
      carta = Carta.new(carta_params)
      if carta.save
        render json: carta, status: :created
      else
        render json: { errors: carta.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # GET /api/cartas/:id/historial
    def historial
      carta = Carta.find(params[:id])
      render json: carta.historial_precios.order(fecha: :desc)
    end

    private

    def carta_params
      params.require(:carta).permit(:nombre, :tipo, :rareza, :imagen_url)
    end
end
