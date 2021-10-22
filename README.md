# Bem-vindo ao Dev4Hire

Esse projeto tem como objetivo de fazer desenvolvedores de todos os níveis encontrarem projetos para trabalharem, ao mesmo tempo que permite gerente de projetos publicarem suas propostas e encontrarem pessoas desenvolvedoras com as melhores competências para seus projetos.

## Construção

Projeto construidos em `Ruby 2.4.10` e `Rails 5.2.6`, com perspectivas de atualização para versões mais novas de Ruby e Rails.

Para adquirir o projeto, primeiro realize um clone do projeto:

```bash
$ path/to/myproject git clone git@github.com:paulo-castellan/dev4hire.git
```

Em seguida instale todas as Gems entrando na pasta do projeto:

```bash
$ path/to/myproject/dev4hire bundle install
```
Para popular o banco de dados do site, execute:

```bash
$ path/to/myproject/dev4hire bin/rails db:seed
```

O site populado contém:

Devs => Desenvolvedor a procura de um trabalho como freelancer. Todo desenvolvedor faz login com usuário e senha e precisa completar seu perfil para se candidatar a um projeto. Seu perfil completo inclui Nome Completo, Nome Social, Data de nascimento, Formação educacional, Experiência profisional, Sobre você.

User => Gerente de Projetos que podem cadastrar projetos e encontrar devs qualificados para sua equipe.

Todo Projeto cadastrado pelo User possui Título, Descrição detalhada, Habilidades desejadas, Preço máximo (por hora), data limite de contratação e uma modalidade de trabalho.

Para botar o servidor no ar use:

```bash
$ path/to/myproject/dev4hire rails server
```

## Uso

Para acessar o site do projeto use o site:

```bash
localhost:3000
```

A Pessoa desenvolvedora padrão populada pelo arquivo `seed.rb`

```bash
email: dev@dev.com
senha: 123456
```

O Gerente de projeto padrão populado pelo arquivo `seed.rb`

```bash
email: user@user.com
senha: 123456
```

## Testes

Os testes foram construidos com a Gem `rspec`, para rodar os testes, execute:

```bash
$ path/to/myproject/dev4hire rspec
```
As gemas simplecov e shoulda-matchers para testes

