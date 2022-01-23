class AdminsAtivo::ConditionsController < AdminsAtivoController
  before_action :set_condition, only: [:edit, :update, :destroy]

  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(params_condition)
    if @condition.save()
      redirect_to admins_ativo_conditions_path, notice: "Condição de Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @condition.update(params_condition)
    if redirect_to admins_ativo_conditions_path, notice: "Condição de Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @condition.destroy
    if redirect_to admins_ativo_conditions_path, notice: "Condição de Ativo excluida. Feito!"
    else
      render :index
    end
  end

  private

  def params_condition
    params_condition = params.require(:condition).permit(:description)
  end

  def set_condition
    @condition = Condition.find(params[:id])
  end
end
