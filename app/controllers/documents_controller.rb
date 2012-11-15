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
    doc =
      current_user.documents.new name: upload.original_filename,
                                 size: upload.read.size
    attrs = {}
    params[:document][:attrs].each { |_, attr| attrs[attr[:name]] = attr[:val] }
    doc.attrs = attrs
    doc.save!

    flash[:notice] = 'Document uploaded'
    redirect_to doc
  end
end
