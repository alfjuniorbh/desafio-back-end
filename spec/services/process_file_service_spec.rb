require 'rails_helper'

RSpec.describe ProcessFileService, type: :service do
  subject { described_class.new(file_fixture('cnab.txt')) }

  describe 'process_file' do
    it 'import file and count created process files' do
      subject.process_file

      expect(ProcessFile.count).to eq(21)

      expect(ProcessFile.first.type_transaction).to eq(2)
      expect(ProcessFile.first.date.to_datetime).to eq('2019-03-01')
      expect(ProcessFile.first.value.to_s).to eq('14200.0')
      expect(ProcessFile.first.cpf).to eq('09620676017')
      expect(ProcessFile.first.card).to eq('4753****3153')
      expect(ProcessFile.first.time.strftime("%k:%M:%S")).to eq('15:34:53')
      expect(ProcessFile.first.owner).to eq('JOÃO MACEDO')
      expect(ProcessFile.first.shop).to eq('BAR DO JOÃO')
    end
  end
end