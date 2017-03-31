json.extract! usuario, :id, :usuario, :nombre, :apellido, :twitter, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
