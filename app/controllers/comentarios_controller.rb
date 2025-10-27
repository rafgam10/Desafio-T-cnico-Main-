class ComentariosController < ApplicationController
  def create
    @filme = Filme.find(params[:filme_id])
    @comentario = @filme.comentarios.build(comentario_params)
    @comentario.user = current_user if user_signed_in?
    @comentario.nome = params[:comentario][:nome] unless user_signed_in?

    if @comentario.save
      redirect_to @filme, notice: "Comentário adicionado com sucesso!"
    else
      redirect_to @filme, alert: "Erro ao adicionar comentário."
    end
  end

  private

  def comentario_params
    params.require(:comentario).permit(:conteudo, :nome)
  end
end
