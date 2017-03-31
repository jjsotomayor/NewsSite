class UsuariosController < ApplicationController
  protect_from_forgery with: :null_session
  #before_action :set_usuario, only: [:edit]#, :destroy]

  before_action :fix_ie_params, only: [:update, :create]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    @users = Usuario.all.order(:id)
    @users.each do |u|
      puts u.id
    end
    #render json: @usuarios
    render 'index.json.jbuilder'
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    if Usuario.exists?(params[:id])
      @usuario = Usuario.find(params[:id])
      render json: @usuario
    else
      render json:   %q[{"error": "Usuario no encontrado"}], status: 404
    end
    #render :show, status: :created, location: @usuario
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create

    puts request.body.string

    if request.body.string.include? %q["id"]
      render json:   %q[{"error": "No se puede crear usuario con id"}], status: 400
    else
      @usuario = Usuario.new(usuario_params)
      #Tuve que hacerlo asi, pq por alguna razon no me dejaba de la forma tradicional!
      #@usuario = Usuario.new
      #@usuario.usuario = params[:usuario]
      #@usuario.nombre = params[:nombre]
      #@usuario.apellido = params[:apellido]
      #@usuario.twitter = params[:twitter]


      respond_to do |format|
        if @usuario.save
          #format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
          format.json { render :show, status: :created, location: @usuario }
        else
          #format.html { render :new }
          format.json { render json: @usuario.errors, status: 404}# status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    if !Usuario.exists?(params[:id])
      render json:   %q[{"error": "Usuario no encontrado"}], status: 404
    elsif request.body.string.include? %q["id"] # id is set
        render json:   %q[{"error": "id no es modificable"}], status: 400






    else
      @usuario = Usuario.find(params[:id])
      respond_to do |format|
        if @usuario.update(usuario_params)
          #format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
          #format.json { render :show, status: :ok, location: @usuario}
          format.json {render json: @usuario}
        else
          #format.html { render :edit }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    if !Usuario.exists?(params[:id])
      render json:   %q[{"error": "Usuario no encontrado"}], status: 404
    else
      @usuario = Usuario.find(params[:id])
      @usuario.destroy
      respond_to do |format|
        #format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
        format.json { }#head: no_content  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_usuario
      #if UsuarioUsuario.find(params[:id]).exists?
      @usuario = Usuario.find(params[:id])
      #else
      #  @usuario = Nil
      #end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      #params.require(:usuario)#.permit(:usuario, :nombre, :apellido, :twitter)
      params.permit(:usuario, :nombre, :apellido, :twitter)
    end

    def fix_ie_params
      if request.format == '*/*'
        # try to JSON decode in case of IE XDR
        begin
          params.merge! ActiveSupport::JSON.decode(request.body.string)
          rescue Exception=>e
            # todo: log exception
          end
        end
      end

end
