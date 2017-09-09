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
    email: "admin@admin.com",
    password: "123456",
    password_confirmation: "123456")

puts "ADMINISTRADOR cadastrado com sucesso!"



# #Cadastrando Produto
# puts "Cadastrando PRODUTOS..."

#   Produto.create!(
#     produto: "Sabao",
#     valor: '1,50'
#     )
# puts "Produto cadastrado com sucesso!"


# Cadastrando pedido
#puts "Cadastrando PEDIDO ..."

#x = Produto.create!(produto: "teste3", valor: 1.2)  # O create já cria e salva o produto
#y = Produto.create!(produto: "teste4", valor: 2.3)

##z = Pedido.new(status: 1)
#z.produtos << x
#z.produtos << y
#z.save!

#puts "PEDIDO cadastrado com sucesso"

