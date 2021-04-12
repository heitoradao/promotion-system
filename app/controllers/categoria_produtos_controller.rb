class CategoriaProdutosController < ApplicationController
  before_action :set_categoria_produto, only: %i[ show edit update destroy ]

  # GET /categoria_produtos or /categoria_produtos.json
  def index
    @categoria_produtos = CategoriaProduto.all
  end

  # GET /categoria_produtos/1 or /categoria_produtos/1.json
  def show
  end

  # GET /categoria_produtos/new
  def new
    @categoria_produto = CategoriaProduto.new
  end

  # GET /categoria_produtos/1/edit
  def edit
  end

  # POST /categoria_produtos or /categoria_produtos.json
  def create
    @categoria_produto = CategoriaProduto.new(categoria_produto_params)

    respond_to do |format|
      if @categoria_produto.save
        format.html { redirect_to @categoria_produto, notice: "Categoria produto was successfully created." }
        format.json { render :show, status: :created, location: @categoria_produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categoria_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria_produtos/1 or /categoria_produtos/1.json
  def update
    respond_to do |format|
      if @categoria_produto.update(categoria_produto_params)
        format.html { redirect_to @categoria_produto, notice: "Categoria produto was successfully updated." }
        format.json { render :show, status: :ok, location: @categoria_produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categoria_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_produtos/1 or /categoria_produtos/1.json
  def destroy
    @categoria_produto.destroy
    respond_to do |format|
      format.html { redirect_to categoria_produtos_url, notice: "Categoria produto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_produto
      @categoria_produto = CategoriaProduto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categoria_produto_params
      params.require(:categoria_produto).permit(:title, :promotions_id)
    end
end
