# packer-proxysql
Criação de AWS AMI do ProxySQL da versão mais recente para estudo e lab.


Para executar:

```sh
# clonar o repo
git clone git@github.com:vyosiura/packer-proxysql.git

# Acessar o repo
cd packer-proxysql

# Por hora, apenas está configurado para executar com shared credential. Nas próximas PR, eu adicionarei outras formas de autenticação
packer build -var 'profile=profile_name' .

# Caso variáveis de ambiente estejam configuradas (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION pelo menos) 
# Não é necessário pasar o -var 'profile=profile_name'
packer build .
```

**Este repo apenas irá gerar a AMI com o ProxySQL. Para criar um EC2 usando esta imagem use a console, alguma ferramenta de gerenciamento de recursos, scripts, etc...**