class ProcessFilesController < ApplicationController
  def home
    #@process = ProcessFile.group(:shop).all
    @process = ProcessFile.select("shop, sum(value) as total_price").group("shop")
  end

  def create
    @process = ProcessFile.new
  end

  def store
    @process = ProcessFile.new
    upload_file = @process.upload(params[:file])

    if !upload_file
      flash[:alert] = "Favor selecionar um arquivo válido"
      redirect_to process_files_create_path
    else
      redirect_to process_files_home_path
    end
  end

end
