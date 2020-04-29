class FatesController < ApplicationController
  before_action :set_fate, only: [:show, :edit, :update, :destroy]

  before_action :require_auth, :except => [:auth]

  # GET /fates
  # GET /fates.json
  def index
    @fates = Fate.order(id: :desc).page(params[:page])
  end

  # GET /fates/1
  # GET /fates/1.json
  def show
  end

  # GET /fates/new
  def new
    @fate = Fate.new
  end

  # GET /fates/1/edit
  def edit
  end

  # POST /fates
  # POST /fates.json
  def create
    @fate = Fate.new(fate_params)

    if @fate.save
      redirect_to fates_path
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fates/1
  # PATCH/PUT /fates/1.json
  def update
    respond_to do |format|
      if @fate.update(fate_params)
        format.html { redirect_to @fate, notice: 'Fate was successfully updated.' }
        format.json { render :show, status: :ok, location: @fate }
      else
        format.html { render :edit }
        format.json { render json: @fate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fates/1
  # DELETE /fates/1.json
  def destroy
    @fate.destroy
    respond_to do |format|
      format.html { redirect_to fates_url, notice: 'Fate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def auth
    if request.post?
      if params[:password] == FATE_SECRET
        cookies[:fate_name] = {value: FATE_SECRET, expires: 30.days}
        redirect_to fates_path
      else
        flash[:alert] = 'wrong password.'
        redirect_to fates_auth_path
      end
    else
      cookies.delete :fate_name
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fate
    @fate = Fate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def fate_params
    params.fetch(:fate, {}).permit!
  end

  def require_auth
    if cookies[:fate_name] && cookies[:fate_name] == FATE_SECRET
      true
    else
      redirect_to fates_auth_path
    end
  end
end
