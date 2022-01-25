class AdminsAtivo::UsersController < AdminsAtivoController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save()
      redirect_to admins_ativo_users_path, notice: "Usuário criado. Parabéns!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to admins_ativo_users_path, notice: "Usuário atualizado. Sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admins_ativo_users_path, notice: "Usuário excluido. Feito!"
    else
      render :index
    end
  end

  private

  def params_user
    params_user = params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
