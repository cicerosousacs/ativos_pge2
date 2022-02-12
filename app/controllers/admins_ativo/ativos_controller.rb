class AdminsAtivo::AtivosController < AdminsAtivoController
  before_action :set_ativo, only: [:show, :edit, :update, :destroy]
  before_action :set_type_options, only: [:new, :create, :edit, :update]

  def index
    if params[:search]
      @ativos = Ativo.includes(:type).search(params[:search]).page(params[:page])
    else
      @ativos = Ativo.includes(:type).page(params[:page])
    end
  end

  def show
    respond_to do |format|
      format.js { render partial: 'admins_ativo/ativos/show' }
    end
  end

  def new
    @ativo = Ativo.new
    respond_to do |format|
      format.html
      format.js { render partial: 'admins_ativo/ativos/ativo' }
    end
  end

  def create
    @ativo = Ativo.new(params_ativo)
    if @ativo.save()
      redirect_to admins_ativo_ativos_path, notice: "Ativo criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js { render partial: 'admins_ativo/ativos/ativo' }
    end
  end

  def update
    if @ativo.update(params_ativo)
      redirect_to admins_ativo_ativos_path, notice: "Ativo atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @ativo.destroy
      redirect_to admins_ativo_ativos_path, notice: "Ativo excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_ativo
    params_ativo = params.require(:ativo).permit(:type_id, :description, :serial, :tombo, :specification, :invoice, :date_acquisition, :warranty, :ata, :bidding)
  end

  def set_ativo
    @ativo = Ativo.find(params[:id])
  end

  def set_type_options
    @type_options = Type.all.pluck(:description, :id)
  end
end
