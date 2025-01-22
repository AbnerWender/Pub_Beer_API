# Pub_Beer_API

Esta é uma API simples de um sistema de gerenciamento de bebidas. Ela permite que os usuários criem, leiam, atualizem e excluam (CRUD) bebidas. A API utiliza o framework Rails e o banco de dados MySQL. A API foi desenvolvida para trabalharmos com tecnologias de deploy e integração contínua.


### Tecnologias Utilizadas

* [Ruby](https://www.ruby-lang.org/pt/)
* [Rails](https://rubyonrails.org/)
* [Docker](https://www.docker.com/)
* [MySQL](https://www.mysql.com/)
*	[Swagger](https://swagger.io/)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [Rspec](https://rspec.info/)
* [Rubocop](https://rubocop.org/)


## Dependências e Versões Necessárias

* Docker - Versão: 24.0.7
* Docker-Compose - Versão: 1.29.2
*	Ruby - Versão: 3.3.6
* Rails - Versão: 8.0.1
* MySQL - Versão: 8.0


## Configuração do Ambiente de Desenvolvimento 🖥️

Instale o Rvm: 
```
sudo gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

sudo curl -sSL https://get.rvm.io/ | bash -s stable

sudo source ~/.rvm/scripts/rvm
```

Instale o Ruby:
```
sudo rvm install 3.3.6

sudo rvm use 3.3.6 --default
```

Depois, instale o Docker:
```
sudo apt install apt-transport-https curl

sudo apt install docker.io

sudo systemctl enable docker

sudo systemctl start docker
```

Instale o Docker-Compose:
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Verifique as dependências do projeto:
```
docker-compose --version

docker --version

rails --version

ruby --version
```


## Notas ❗
- Estamos usando o banco de dados em um container Docker. Logo os arquivos Dockerfile e docker-compose.yml estão com a configuração dessa conexão.
- O arquivo docker-compose.yml está configurado para usar o MySQL 8.0.


## Como rodar o projeto ✅

Para que a API funcione corretamente, siga o passo a passo abaixo:

Clone o repositório com o comando "git clone https://github.com/USUARIO DA ONDE O REPOSITORIO FOI CLONADO/Pub_Beer_API.git"

Crie o container do banco de dados com o comando "docker-compose up -d"
```
bundle install
docker-compose up -d
```

Inicie o container
```
docker-compose start
```

Suba o servidor da API  
```
rails s
```

Acesse a API em "http://localhost:3000" no seu navegador.

Para parar o servidor da API, pressione "Ctrl + C" no terminal.

Para parar o container do banco de dados.
```
docker-compose stop
```

Para remover o container do banco de dados.
```
docker-compose down
```

## Use o comando make para rodar a API de forma simplificada

Construir a imagem do container
```
make build
```

Iniciar o container e o servidor da API
```
make start
```

Parar o container e o servidor da API
```
make stop
```

Para remover o container 
```
make down
```

Para obter ajuda ou ver as opções do comando make
```
make help
```

## Como rodar os testes

```
make test
```


## 📌 Exemplos de respostas as requisições 📌

Rota para listar todas as bebidas
* Método: GET	
* URL: /beers
* Descrição : Retorna uma lista de todas as bebidas cadastradas no sistema.

Resposta de sucesso (Status 200):
```
[
  {
    "id": 3,
    "name": "Ciroq",
    "style": "Vodka",
    "created_at": "2024-12-19T18:35:26.613Z",
    "updated_at": "2024-12-19T18:35:26.613Z"
  },
  {
    "id": 4,
    "name": "Red Label",
    "style": "Whisky",
    "created_at": "2024-12-19T18:36:17.237Z",
    "updated_at": "2024-12-19T18:36:17.237Z"
  }
]
```

Rota para criar uma nova bebida
* Método: POST
* URL: /beers
* Descrição : Cadastra uma nova bebida no sistema.

Corpo da requisição:
```
{
  "name": "lala_name",
  "style": "lala_beer"
}
```

Resposta de sucesso (Status 201):
```
{
  "id": 7,
  "name": "lala_name",
  "style": "lala_beer",
  "created_at": "2025-01-16T21:12:06.899Z",
  "updated_at": "2025-01-16T21:12:06.899Z"
}
```

## Configuração do Nginx 

Remover a versão antiga do Nginx:
```
sudo apt remove --purge nginx nginx-common nginx-full -y

sudo apt autoremove -y
```

Atualizar a lista de pacotes e instalar dependências necessárias:
```
sudo apt update

sudo apt install curl gnupg2 ca-certificates lsb-release -y
```

Adicionar o repositório oficial do Nginx:
```
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo gpg --dearmor -o /usr/share/keyrings/nginx-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
```

Atualizar a lista de pacotes novamente e instalar uma versão específica do Nginx:
```
sudo apt update

apt-cache madison nginx

sudo apt install nginx=1.26.2-1~focal

nginx -v
```

Impedir atualizações automáticas para o Nginx:
```
sudo apt-mark hold nginx
```

Reverter o "hold" no pacote Nginx (se necessário):
```
sudo apt-mark unhold nginx
```

Configurar o Nginx para a aplicação Rails:

  - Criar e editar o arquivo de configuração do Nginx:
```
sudo nano /etc/nginx/sites-available/rails_app
```

Adicionar a seguinte configuração ao arquivo:
```
server {

    listen 80;

    server_name pubapi.servebeer.com;


    location / {

        proxy_pass http://127.0.0.1:3000;

        proxy_set_header Host $host;

        proxy_set_header X-Real-IP $remote_addr;

        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_set_header X-Forwarded-Proto $scheme;

    }

}
```

Habilitar a configuração do site:
```
sudo ln -s /etc/nginx/sites-available/rails_app /etc/nginx/sites-enabled/
```

Testar a configuração do Nginx:
```
sudo nginx -t
```

Recarregar o Nginx:
```
sudo systemctl reload nginx
```

Verificar e criar diretórios se necessário:

Caso após a desinstalação do Nginx antigo não existam os diretórios {sites-enabled} e {sites-available}, execute:
```
sudo nano /etc/nginx/nginx.conf
```

Adicionar a linha de inclusão se não existir:
```
http {

    include /etc/nginx/mime.types;

    include /etc/nginx/sites-enabled/*;

    ...

}
```

Criar os diretórios se necessário:
```
sudo mkdir -p /etc/nginx/sites-available

sudo mkdir -p /etc/nginx/sites-enabled
```

Ajustar permissões dos diretórios:
```
sudo chmod 755 /etc/nginx/sites-available /etc/nginx/sites-enabled
```

Repetir a habilitação do site (se necessário):
```
sudo ln -s /etc/nginx/sites-available/rails_app /etc/nginx/sites-enabled/
```

Configurar o Rails para aceitar o domínio:

Editar o arquivo de configuração do ambiente de desenvolvimento:
```
nano config/environments/development.rb
```

Adicionar a seguinte linha dentro da indentação:
```
config.hosts << "pubapi.servebeer.com"
```

Reiniciar os serviços do Rails:
```
make stop

make start
```

## Certbot

Usamos certbot para configuração do Certificado SSL

Instale o certbot:

```
sudo apt install certbot python3-certbot-nginx
```

Certifique a configuração do Nginx e certbot:

```
sudo nginx -t
```

Esse deve ser o resultado:
```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Reinicie o serviço do Nginx:
```
service nginx restart
```

Use o certbot para gerar o certificado SSL:
```
certbot --nginx
```
Selecione o domínio e o tipo de certificado que você deseja gerar.
```
Which names would you like to activate HTTPS for?
- - - - - - - - - - - - - - - - - - - -
1: pubapi.servebeer.com
- - - - - - - - - - - - - - - - - - - -
Select the appropriate numbers separated by commas and/or spaces, or leave input blank to select all options shown
```
Selecione o número 1 e pressione Enter.

Em seguida:
```
Please choose whether or not to redirect HTTP traffic to HTTPS, removing HTTP access.
- - - - - - - - - - - - - - - - - - - -
1: No redirect - Make no further changes to the web server configuration.
2: Redirect - Make all requests redirect to secure HTTPS access. Choose this for new websites, or if you've confident your website works on HTTPS. You can undo this change by editing your web server's configuration.
- - - - - - - - - - - - - - - - - - - -
Select the appropriate number:
```
Selecione 2 para gerar o certificado SSL.
Após a configuração, você já pode acessar o seu site com HTTPS.
