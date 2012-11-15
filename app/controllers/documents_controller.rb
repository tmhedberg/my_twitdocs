class DocumentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def show
    @doc = Document.find params[:id]
  end

  def new
    @doc = Document.new
  end

  def create
    upload = params[:document][:upload_data]
    data = upload.read
    doc =
      current_user.documents.create! name: upload.original_filename,
                                     size: data.size

    flash[:notice] = 'Document uploaded'
    redirect_to doc
  end
end
