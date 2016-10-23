class TaxesController < ApplicationController
  before_action :set_tax, only: [:show, :edit, :update, :destroy]

  # GET /taxes
  # GET /taxes.json
  def index
    if params[:name] == "tkbtkb"
      @taxes = Tax.all.order(:user_name)
    else
      @taxes = Tax.where('user_name=? and user_vorname=? and user_pw=?', params[:name], params[:vorname], params[:pw])
      @user_name = params[:name]
      @user_vorname = params[:vorname]
      @user_pw = params[:pw]
    end
  end

  # GET /taxes/1
  # GET /taxes/1.json
  def show
  end

  # GET /taxes/new
  def new
      @tax = Tax.new
      @tax.user_name = params[:name]
      @tax.user_vorname = params[:vorname]
      @tax.user_pw = params[:pw]
      
      if !params[:do_nothing]
        @tax.qsteuer_p = 4.5
        @tax.alv_p = 1.1
        @tax.ahv_p = 5.1
        @tax.pk_p = 4
        @tax.kv = 300
        @tax.user_sex = "männlich"
        @tax.kurs = 0.935
        @tax.brutto = 7000
        @tax.steuer_fw = 0
        @tax.soli_fw = 0
        @tax.kirche_fw = 0
      end
      calculate
  end
  
  def calculate
    @tax.qsteuer = (@tax.qsteuer_p * @tax.brutto)/100
    if @tax.user_sex == "männlich"
      @tax.suva_p = 1.41
    else
      @tax.suva_p = 0.88
    end
    @tax.suva = (@tax.suva_p * @tax.brutto)/100
    @tax.ahv = (@tax.ahv_p * @tax.brutto)/100
    @tax.alv = (@tax.alv_p * @tax.brutto)/100
    @tax.pk = (@tax.pk_p * @tax.brutto)/100
    @tax.sum = @tax.brutto - @tax.qsteuer - @tax.suva - @tax.ahv - @tax.alv - @tax.pk - @tax.kv
    @tax.sum_fw = @tax.sum * @tax.kurs
    @tax.anrechnung_q = (@tax.qsteuer * @tax.kurs)*-1
    @tax.steuervoraus = @tax.steuer_fw + @tax.soli_fw + @tax.kirche_fw + @tax.anrechnung_q
    @tax.netto = @tax.sum_fw - @tax.steuervoraus

  end

  # GET /taxes/1/edit
  def edit
    calculate
  end

  # POST /taxes
  # POST /taxes.json
  def create
    @tax = Tax.new(tax_params)
    respond_to do |format|
      if @tax.save
        if params[:commit] == "Speichern"
          format.html { redirect_to taxes_path :name => @tax.user_name, :vorname => @tax.user_vorname, :pw => @tax.user_pw, notice: 'Tax was successfully created.' }
          format.json { render :show, status: :created, location: @tax }
        end
        if params[:commit] == "Berechnen"
          format.html { redirect_to edit_tax_path(@tax.id), notice: 'Tax was successfully created.' }
          format.json { render :show, status: :created, location: @tax }
        end
      else
        format.html { render :new }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxes/1
  # PATCH/PUT /taxes/1.json
  def update
    respond_to do |format|
      if @tax.update(tax_params)
        if params[:commit] == "Speichern"
          format.html { redirect_to taxes_path :name => @tax.user_name, :vorname => @tax.user_vorname, :pw => @tax.user_pw, notice: 'Tax was successfully updated.' }
          format.json { render :show, status: :ok, location: @tax }
        end
        if params[:commit] == "Berechnen"
          format.html { redirect_to edit_tax_path(@tax.id), notice: 'Tax was successfully updated.' }
          format.json { render :show, status: :ok, location: @tax }
        end
      else
        format.html { render :edit }
        format.json { render json: @tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxes/1
  # DELETE /taxes/1.json
  def destroy
    @name = @tax.user_name
    @vorname = @tax.user_vorname
    @pw = @tax.user_pw
    @tax.destroy
    respond_to do |format|
      format.html { redirect_to taxes_url :name => @name, :vorname => @vorname, :pw => @pw, notice: 'Tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @tax = Tax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tax_params
      params.require(:tax).permit(:user_id, :user_name, :user_vorname, :user_pw, :kv, :user_sex, :brutto, :qsteuer, :qsteuer_p, :suva, :suva_p, :ahv, :ahv_p, :alv, :alv_p, :pk, :pk_p, :sum, :sum_fw, :kurs, :steuer_fw, :soli_fw, :kirche_fw, :anrechnung_q, :steuervoraus, :netto)
    end
end
