class AdminsAtivo::SituationsController < AdminsAtivoController
  before_action :set_situation, only: [:edit, :update, :destroy]
  before_action :set_condition_options, only: [:new, :create, :edit, :update]

  def index
    @situations = Situation.includes(:condition)
  end

  def new
    @situation = Situation.new
  end

  def create
    @situation = Situation.new(params_situation)
    if @situation.save()
      redirect_to admins_ativo_situations_path, notice: "Situação de Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @situation.update(params_situation)
      redirect_to admins_ativo_situations_path, notice: "Situação de Ativo atualizada. Parabéns!"
    else
      render :edit
    end
  end

  def destroy
    if @situation.destroy
      redirect_to admins_ativo_situations_path, notice: "Situação de Ativo excluida. Feito!"
    else
      render :index
    end
  end

  private

  def params_situation
    params_situation = params.require(:situation).permit(:condition_id, :description)
  end

  def set_situation
    @situation = Situation.find(params[:id])
  end

  def set_condition_options
    @condition_options = Condition.all.pluck(:description, :id)
  end
end