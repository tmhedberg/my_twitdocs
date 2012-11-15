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
    params[:document].select { |key, _| key =~ /^name-\d+$/ }.each do |key, val|
      attrs[val] = params[:document]["val-#{key.match(/\d+$/)[0]}"]
    end
    doc.attrs = attrs
    doc.save!

    flash[:notice] = 'Document uploaded'
    redirect_to doc
  end
end
