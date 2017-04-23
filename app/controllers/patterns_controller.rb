class PatternsController < ApplicationController
  before_action :set_pattern, only: [:show, :edit, :update, :destroy]
  respond_to :js

  # GET /patterns
  # GET /patterns.json
  def index
    @patterns = Pattern.all
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

    respond_to do |format|
      if @pattern.save
        format.html { redirect_to @pattern, notice: 'Pattern was successfully created.' }
        format.json { render :show, status: :created, location: @pattern }
      else
        format.html { render :new }
        format.json { render json: @pattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patterns/1
  # PATCH/PUT /patterns/1.json
  def update
    respond_to do |format|
      if @pattern.update(pattern_params)
        format.html { redirect_to @pattern, notice: 'Pattern was successfully updated.' }
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
      format.html { redirect_to patterns_url, notice: 'Pattern was successfully destroyed.' }
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
