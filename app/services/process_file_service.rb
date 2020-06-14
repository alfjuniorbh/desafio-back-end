class ProcessFileService
  attr_reader :file, :type_transaction, :date, :value, :cpf, :time, :card, :owner, :shop

  def initialize(file)
    @file = file
  end

  def process_file
    File.readlines(@file).each do |line|
      find_file(line)
      create_process_file
    end
  end

  private

  def find_file(line)
    @type_transaction = line[1, 1]
    @date = line[1..8]
    @value = line[9..18]
    @cpf = line[19..29]
    @card = line[30..41]
    @time = (line[1..8] + line[42..47])
    @owner = line[48..61]
    @shop = line[62..81]
  end

  def create_process_file
    ProcessFile.create(
      type_transaction: @type_transaction.strip,
      date: @date.strip,
      value: @value.strip,
      cpf: @cpf.strip,
      card: @card.strip,
      time: @time.strip,
      owner: @owner.strip,
      shop: @shop.strip
    )
  end
end