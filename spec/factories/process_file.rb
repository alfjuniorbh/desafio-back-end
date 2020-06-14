# spec/factories.rb
FactoryBot.define do
  factory :process_file do
    type_transaction {2}
    date {'2019-03-01'}
    value {111}
    cpf {'09620676017'}
    card {'4753****3153'}
    time {'2019-03-01 15:34:53'}
    owner {FFaker::NameBR}
    shop {FFaker::Lorem.word}
  end
end