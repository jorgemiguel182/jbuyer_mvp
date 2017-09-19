class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  def index
    @admins = Admin.all
  end
  
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to root_path, notice: "O administrador (#{@admin.email}) foi cadastrado com sucesso!"
    else 
      render :new
    end
  end
  
   def edit
    
  end

  def update   
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O administrador (#{@admin.email}) foi cadastrado com sucesso!"
    else 
      render :edit
    end
  end
  
  private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def params_admin
       passwd = params[:admin][:password]
       passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    end
  
  
end
