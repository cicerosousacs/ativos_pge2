class AdminsAtivo::VinculosController < AdminsAtivoController
  before_action :set_vinculo, only: [:show, :edit, :update, :destroy]
  before_action :set_user_option, only: [:new, :create, :edit, :update]
  before_action :set_area_option, only: [:new, :create, :edit, :update]
  before_action :set_subarea_option, only: [:new, :create, :edit, :update]
  before_action :set_selects_options, only: [:show, :new, :create, :edit, :update]

  def index
    @vinculos = Vinculo.includes(:user, :area, :subarea)
  end

  def show
    @vinculos = Vinculo.all
  end

  def new
    @vinculo = Vinculo.new
    4.times {@addativos = @vinculo.addativos.build}
  end

  def create
    @vinculo = Vinculo.create(params_vinculo)
    if @vinculo.save()
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @vinculo.update(params_vinculo)
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @vinculo.destroy
      redirect_to admins_ativo_vinculos_path, notice: "Vinculo removido. Sucesso!"
    else
      render :index
    end
  end

  private

  def set_vinculo
    @vinculo = Vinculo.find(params[:id])
  end

  def params_vinculo
    params_vinculo = params.require(:vinculo).permit(
    :user_id, 
    :area_id, 
    :subarea_id, 
    :detvinculo,    
    addativos_attributes: [:id, :tombo, :description, :condition, :situation, :_destroy])
  end

  def set_user_option
    @user_option = User.all.pluck(:name, :id)
  end

  def set_area_option
    @area_option = Area.all.pluck(:description, :id)
  end

  def set_subarea_option
    @subarea_option = Subarea.all.pluck(:description, :id)
  end

  def set_selects_options
    @ativos = Ativo.all
    @conditions = Condition.all
    @situations = Situation.all
  end

end
