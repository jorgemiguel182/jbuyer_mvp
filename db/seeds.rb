# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Cadastrando Administrador
puts "Cadastrando o ADMINISTRADOR..."

Admin.create!(
    name: "Jorge Miguel",
    email: "admin@admin.com",
    password: "123456",
    password_confirmation: "123456",
    role: 0)

Admin.create!(
    name: "Bruno",
    email: "teste@teste.com",
    password: "123456",
    password_confirmation: "123456",
    role: 1)

puts "ADMINISTRADOR cadastrado com sucesso!"


#Cadastrando Tipos de Produtos
puts "Cadastrando Tipos de Produtos"
  15.times do 
    TipoProduto.create!(
      nome_tipo: Faker::Commerce.department(2, true),
      desc_tipo: Faker::Commerce.department
    )
  end
puts "Tipos de Produtos Cadastrados"




# Cadastrando produtos/pedido
puts "Cadastrando PRODUTOS ..."
50.times do 
  x = Produto.new(
    produto: Faker::Commerce.product_name, 
    valor_venda: Faker::Commerce.price, 
    valor_pago: Faker::Commerce.price, 
    qtd_estoque: Random.rand(50..150), 
    desc_produto: Faker::Lorem.sentence 
  )  
  x.tipo_produto = TipoProduto.all.sample
  x.save!
end
puts "PRODUTOS cadastrados com sucesso!"

# Cadastrando User
15.times do
  puts "Cadastrando USER..."
  u = User.new(
    nome: Faker::Name.name, 
    cpf: Faker::Number.number(10), 
    tel_fixo: Faker::PhoneNumber.phone_number, 
    tel_cel: Faker::PhoneNumber.cell_phone, 
    email: Faker::Internet.email
  )
  
  # Cadastrando Endereço
  puts " Cadastrando Endereco"
  en = Endereco.create!(rua: Faker::Address.street_address,
    cidade: Faker::Address.city_prefix,
    uf: Faker::Address.country_code,
    cep: Faker::Address.zip_code,
    complemento: Faker::Address.secondary_address)
  puts " Endereco Cadastrado....."
  
  u.endereco = en  
2.times do
puts " Cadastrando PEDIDO..."
  z = Pedido.create!(
    status: Random.rand(1..3), 
    numero_nf: Faker::Number.number(6),    
    updated_at: Faker::Time.between(DateTime.now - 30, DateTime.now - 1) 
  )

puts "  Cadastrando Itens do pedido..."  
  20.times do
    pedprod = PedidoProduto.new(contador: Faker::Number.between(1, 5))
    pedprod.produto = Produto.all.sample
    pedprod.pedido = z
    pedprod.save!
  end
puts "  Itens do pedido cadastrados"
puts " PEDIDO cadastrado com sucesso"



  
  u.pedidos << z  
  
  u.save
  end
puts "USER cadastrado com sucesso..."
end


