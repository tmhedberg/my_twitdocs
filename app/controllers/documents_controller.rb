class DocumentsController < ApplicationController
  def show
    @doc = Document.find params[:id]
  end
end
