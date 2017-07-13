class PatternsController < ApplicationController
  before_action :admin_check, only: [:new, :create, :edit, :update, :destroy] #in app controller
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]
  respond_to :js

  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.all.order(title_ru: :asc)
  end
#improve action below later
  def by_date
    @patterns = Pattern.all.order("created_at DESC")
    render action: :index
  end

  def price_roubles
    @patterns = Pattern.all.order(price_rub: :desc)
    render action: :index
  end

  def price_dollars
    @patterns = Pattern.all.order(price_usd: :desc)
    render action: :index
  end

  def scenery
    @patterns = Pattern.where(category: ['Scenery', 'Пейзаж'])
    render action: :index
  end

  def portrait
    @patterns = Pattern.where(category: ['Portrait', 'Портрет'])
    render action: :index
  end
#keep for a while
  def still_life
    @patterns = Pattern.where(category: ['Натюрморт', 'Still life'])
    render action: :index
  end

  def genre_scene
    @patterns = Pattern.where(category: ['Жанровая сцена', 'Genre Scene'])
    render action: :index
  end
  # GET /patterns/1
  # GET /patterns/1.json
  def show
  end

  # GET /patterns/new
  def new
    @pattern = Pattern.new
  end

  # GET /patterns/1/edit
  def edit
  end

  # POST /patterns
  # POST /patterns.json
  def create
    @pattern = Pattern.new(pattern_params)
    @admins = User.where(admin: true)
      if @pattern.save
        #create notification, notify all admins except the actor, on production - replace with (@admins.uniq - [current_user]).each do |user|
          @admins.each do |admin|
            AdminNotification.create(recipient: admin, actor: current_user, action: "создал(а)", notifiable: @pattern)
          end
          redirect_to @pattern, notice: 'Схема успешно создана'
      else
        render :new
      end
  end

  # PATCH/PUT /patterns/1
  # PATCH/PUT /patterns/1.json
  def update
    respond_to do |format|
      if @pattern.update(pattern_params)
        format.html { redirect_to @pattern, notice: 'Схема успешно обновлена' }
        format.json { render :show, status: :ok, location: @pattern }
      else
        format.html { render :edit }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patterns/1
  # DELETE /patterns/1.json
  def destroy
    @pattern.destroy
    respond_to do |format|
      format.html { redirect_to patterns_url, notice: 'Схема удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pattern
      @pattern = Pattern.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pattern_params
      params.require(:pattern).permit(:title_en, :title_ru, :description_en, :description_ru, :price_usd, :price_rub, :designer, :size, :category, :image)
    end
end
