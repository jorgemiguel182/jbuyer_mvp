class Backoffice::UsersController < BackofficeController    
  before_action :set_user, only: [:edit, :update]
    
  
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
  
  def edit
  end
  
  def update   
    respond_to do |format|
      if @user.update(params_user)
        format.json { render json: @user, status: :ok }    
      else 
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create
    @user = User.new(params_user)    
    respond_to do |format|
      if @user.save!
        format.json { render json: @user, include: :endereco}
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def params_user
       passwd = params[:user][:password]
       passwd_confirmation = params[:user][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:user].except!(:password, :password_confirmation)
    end

      params.require(:user).permit(:nome, 
        :email, 
        :password, 
        :password_confirmation, 
        :cpf, 
        :tel_fixo, 
        :tel_cel,
        :endereco_id,
        endereco_attributes:[
          :rua,
          :bairro,
          :cidade,
          :uf,
          :cep,
          :referencia,
          :numero,
          :complemento          
          ]
        )
    end  
  
end
