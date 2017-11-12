json.produtos @lista do |lista|
  json.id           lista.id
  json.produto      lista.produto
  json.qtd_estoque  lista.qtd_estoque
  json.desc_produto lista.desc_produto
  json.valor_pago   lista.valor_pago
  json.valor_venda  lista.valor_venda
  json.tipo_produto_id lista.tipo_produto_id
  json.foto url_to_image(lista.foto.url(:medium))
end

