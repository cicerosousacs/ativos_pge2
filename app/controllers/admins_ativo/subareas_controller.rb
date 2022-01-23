class AdminsAtivo::SubareasController < AdminsAtivoController
  before_action :set_subarea, only: [:edit, :update, :destroy]
  before_action :set_area_options, only: [:new, :create, :edit, :update]

  def index
    @subareas = Subarea.includes(:area).page(params[:page])
  end

  def new
    @subarea = Subarea.new
  end

  def create
    @subarea = Subarea.new(params_subarea)
    if @subarea.save()
      redirect_to admins_ativo_subareas_path, notice: "Área criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subarea.update(params_subarea)
      redirect_to admins_ativo_subareas_path, notice: "Área atualizada. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @subarea.destroy
      redirect_to admins_ativo_subareas_path, notice: "Área excluida. Feito!"
    else
      render :index
    end
  end

  private

  def params_subarea
    params_subarea = params.require(:subarea).permit(:area_id, :description )
  end

  def set_subarea
    @subarea = Subarea.find(params[:id])
  end

  def set_area_options
    @area_options = Area.all.pluck(:description, :id)
  end
end
