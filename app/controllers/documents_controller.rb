class DocumentsController < ApplicationController
  def show
    @doc = Document.find params[:id]
  end

  def new
    @doc = Document.new
  end
end
