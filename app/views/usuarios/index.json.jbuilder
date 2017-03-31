#json.array! @usuarios, partial: 'usuarios/usuario', as: :usuario



json.usuarios @usuarios do |user|
  json.id user.id
  json.nombre user.nombre
  json.apellido user.apellido
  json.usuario user.usuario
  json.twitter user.twitter
end
json.total @usuarios.count
