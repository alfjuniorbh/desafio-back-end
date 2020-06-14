class ProcessFilesController < ApplicationController
  def home
    ProcessFileService.new(File.join Rails.root, "CNAB.txt").process_file
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
