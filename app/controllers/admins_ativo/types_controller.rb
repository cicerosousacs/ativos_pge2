class AdminsAtivo::TypesController < AdminsAtivoController
  before_action :set_type, only: [:edit, :update, :destroy]

  def index
    @types = Type.all
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(params_type)
    if @type.save()
      redirect_to admins_ativo_types_path, notice: "Tipo de Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @type.update(params_type)
      redirect_to admins_ativo_types_path, notice: "Tipo de Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @type.destroy
      redirect_to admins_ativo_types_path, notice: "Tipo de Ativo excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_type
    params_type = params.require(:type).permit(:description)
  end

  def set_type
    @type = Type.find(params[:id])
  end

end