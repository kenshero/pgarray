class DocsController < ApplicationController
  def index
    if params[:q].present?
      @docs = Doc.journal_search(params[:q],params[:choice]).results
      # doc_search = params[:q]
      # @docs = Doc.where(" '#{doc_search}' % ANY (words)")
    else
      @docs = Doc.all
    end
  end

  def new
    @doc  = Doc.new
  end

  def create
    # render plain: doc_params
    @doc = Doc.new(doc_params)
    if @doc.save
      redirect_to docs_path
    else
      render 'new'
    end
  end

  def edit
    @doc = Doc.find(doc_id_param)
  end

  def update
    @doc = Doc.find(doc_id_param)
    if @doc.update_attributes(doc_params)
      redirect_to docs_path
    else
      render 'edit'
    end
  end

  def show
    @doc = Doc.find(doc_id_param)
  end

  def destroy
    @doc = Doc.find(doc_id_param)
    if @doc.destroy
      redirect_to docs_path
    end
  end

  private
    def doc_id_param
      params[:id]
    end

    def doc_params
      params.require(:doc).permit(:name, { words: [] },:pdf,:author,:year,:publisher,:description)
    end
end