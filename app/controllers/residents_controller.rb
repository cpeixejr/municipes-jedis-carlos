class ResidentsController < ApplicationController
  before_action :set_resident, only: %i[show edit update switch_status]

  # GET /residents or /residents.json
  def index
    @residents = Resident.order(created_at: :desc).includes(:address).page params[:page]

    # render json: { data: @residents }, status: :ok
  end

  # GET /residents/1 or /residents/1.json
  def show; end

  # GET /residents/new
  def new
    @resident ||= Resident.new
    @resident.build_address
  end

  # GET /residents/1/edit
  def edit; end

  # POST /residents or /residents.json
  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        format.html { redirect_to residents_url, notice: 'Resident was successfully created.' }
        format.json { render :show, status: :created, location: @resident }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residents/1 or /residents/1.json
  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to resident_url(@resident), notice: 'Resident was successfully updated.' }
        format.json { render :show, status: :ok, location: @resident }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def switch_status
    return unless @resident

    if @resident.update(is_active: !@resident.is_active)
      flash[:success] = 'Status alterado com sucesso!'
      redirect_to residents_path
    else
      flash[:error] = 'Não foi possivel alterar o status!'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_resident
    @resident = Resident.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def resident_params
    params.require(:resident)
          .permit(:full_name, :cpf, :cns, :email, :birth_date, :phone, :avatar, :is_active,
                  address_attributes: %i[id cep street neighborhood city state secondary_address])
  end
end
