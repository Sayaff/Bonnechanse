class StrandsController < ApplicationController
  before_action :admin_check, only: [:new, :create, :edit, :update, :destroy] #in app controller
  before_action :set_strand, only: [:show, :edit, :update, :destroy]
  respond_to :js

  # GET /strands
  # GET /strands.json
  def index
    @strands = Strand.all.order(title_ru: :asc)
  end

  # GET /strands/1
  # GET /strands/1.json
  def show
  end

  # GET /strands/new
  def new
    @strand = Strand.new
  end

  # GET /strands/1/edit
  def edit
  end

  # POST /strands
  # POST /strands.json
  def create
    @strand = Strand.new(strand_params)
    @admins = User.where(admin: true)
      if @strand.save
        #create notification, same as in other product groups
        @admins.each do |admin|
          AdminNotification.create(recipient: admin, actor: current_user, action: "создал(а)", notifiable: @strand)
        end
        redirect_to @strand, notice: 'Товар успешно создан'
      else
        render :new
      end
  end

  # PATCH/PUT /strands/1
  # PATCH/PUT /strands/1.json
  def update
    respond_to do |format|
      if @strand.update(strand_params)
        format.html { redirect_to @strand, notice: 'Товар успешно обновлен' }
        format.json { render :show, status: :ok, location: @strand }
      else
        format.html { render :edit }
        format.json { render json: @strand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strands/1
  # DELETE /strands/1.json
  def destroy
    @strand.destroy
    respond_to do |format|
      format.html { redirect_to strands_url, notice: 'Товар удалён' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strand
      @strand = Strand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strand_params
      params.require(:strand).permit(:title_en, :title_ru, :manufacturer, :price_usd, :price_rub, :color, :storage_quantity, :image)
    end
end
