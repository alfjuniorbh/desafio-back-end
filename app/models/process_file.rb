class ProcessFile < ApplicationRecord
  validates :type_transaction, :date, :value, :cpf, :time, :card, :owner, :shop, presence: true

  before_create :value_exact
  before_create :transform_date
  before_create :transform_time_zone


  def upload(file)
    if file.present? && File.extname(file) == '.txt'
      if file.is_a?(String)
        super(file)
      else
        file_name = "#{Time.now.to_i}-#{file.original_filename}"
        path_of_file = "#{Rails.root}/public/files/"
        path_with_file = "#{path_of_file}#{file_name}"

        Dir.mkdir(path_of_file) unless Dir.exists?(path_of_file)
        File.open(path_with_file, "wb") { |f| f.write(file.read) }

        ProcessFileService.new(File.join Rails.root, "/public/files/#{file_name}").process_file
      end
      true
    else
      false
    end
  end
  

  private

  def value_exact
    value.to_d / 100
  end

  def transform_date
    date.to_datetime
  end

  def transform_time_zone
    time.in_time_zone.utc
  end
end
