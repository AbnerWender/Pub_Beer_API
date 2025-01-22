Rswag::Ui.configure do |c|
  # Define o endpoint Swagger
  c.swagger_endpoint '/api-docs/v1/swagger.yaml', 'API V1 Docs'
  
  # Use o novo método openapi_endpoint para compatibilidade futura
  c.openapi_endpoint '/api-docs/v1/swagger.yaml', 'API V1 Docs'

  # Adicione autenticação básica se sua API for privada
  # c.basic_auth_enabled = true
  # c.basic_auth_credentials 'username', 'password'
end