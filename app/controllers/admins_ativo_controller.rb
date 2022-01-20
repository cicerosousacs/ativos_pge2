class AdminsAtivoController < ApplicationController
  before_action :authenticate_admin!
  layout 'admins_ativo'
end
