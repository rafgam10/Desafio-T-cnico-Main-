


class FilmesController < ApplicationController
  before_action :set_filme, only: %i[ show edit update destroy ]


  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_filme, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # GET /filmes or /filmes.json
  def index
    @filmes = Filme.order(ano: :desc).page(params[:page]).per(6)
  end


  # GET /filmes/1 or /filmes/1.json
  def show
  end

  # GET /filmes/new
  def new
    @filme = Filme.new
  end

  # GET /filmes/1/edit
  def edit
  end

  # POST /filmes or /filmes.json
  def create
  @filme = Filme.new(filme_params)

  respond_to do |format|
    if @filme.save
      format.html { redirect_to @filme, notice: "Filme cadastrado com sucesso!" }
      format.json { render :show, status: :created, location: @filme }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @filme.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /filmes/1 or /filmes/1.json
  def update
    respond_to do |format|
      if @filme.update(filme_params)
        format.html { redirect_to @filme, notice: "Filme was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @filme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @filme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filmes/1 or /filmes/1.json
  def destroy
    @filme.destroy!

    respond_to do |format|
      format.html { redirect_to filmes_path, notice: "Filme was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filme
      @filme = Filme.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def filme_params
      params.expect(filme: [ :titulo, :sinopse, :ano, :duracao, :diretor, :user_id ])
    end
end




private

def authorize_user!
  redirect_to filmes_path, alert: "Você não tem permissão para isso." unless @filme.user == current_user
end

def set_filme
  @filme = Filme.find(params[:id])
end

def filme_params
  params.require(:filme).permit(:titulo, :sinopse, :ano, :duracao, :diretor)
end
