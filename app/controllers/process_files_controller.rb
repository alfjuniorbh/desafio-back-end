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
    @process.upload(params[:file])
    redirect_to process_files_home_path
  end

end
