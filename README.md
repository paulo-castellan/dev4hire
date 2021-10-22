Bem vindo ao Dev4Hire

Esse projeto tem como objetivo de fazer desenvolvedores de todos os níveis encontrarem projetos para trabalharem, ao mesmo tempo que faz gerente de projetos publicarem suas propostas e encontrarem  os dev com as melhores competências para seus projetos.

O projeto foi construido em Ruby 2.4.10 e Rails  5.2.6, apesar de existir uma perspectivas de atualização do projeto para versões mais atuais, essas versões serão mantidas até o projeto ter uma amplitude de testes mais ampla.

A rede de testes O Dev4Hire é construido em cima da Gem rspec. Além disso, outras gemas que serão utilizadas para testagem são as SimpleCov e shoulda-matchers. Dessa forma, é necessário executar: `bundle install` para que todas as gemas sejam propriamente instaladas.

Para utilizar o projeto localmente é necessário rodar `bin/rails server` e acessar no seu no seu navegador `localhost:3000` para a página principal.

Para conferir todos os testes basta rodar no terminal `rspec` na pasta do projeto.

Para popular o banco de dados é necessário `bin/rails db:seed`

O projeto é dividido em dois tipos de usuários.

Devs => Desenvolvedor a procura de um trabalho como freelancer. Todo desenvolvedor faz login com usuário e senha e precisa completar seu perfil para se candidatar a um projeto. Seu perfil completo inclui Nome Completo, Nome Social, Data de nascimento, Formação educacional, Experiência profisional, Sobre você

Para acessar o projeto como Dev/User padrão criado pelo arquivo seeds.rb é possivel acessar a página principal `localhost:3000` entrar como Pessoa Desenvolvedora/Gerente de projetos e usar `e-mail: dev@dev.com, senha: 123456` ou `email: user@user.com, senha: 123456`, para Dev e User respectivamente

User => Gerente de Projetos que podem cadastrar projetos e encontrar devs qualificados para sua equipe.

Todo Projeto cadastrado pelo User possui Título, Descrição detalhada, Habilidades desejadas, Preço máximo (por hora), data limite de contratação e uma modalidade de trabalho.

Para um Dev participar de um Projeto ele vai usar o modelo "project_proposition", nesse modelo o dev deve fornecer todas informações para poder se cadastrar para um projeto como: motivação, pagamento esperado, horas disponíveis para trabalhar, expectativas. Quando um project_proposition é criado, seu status é pending, poís fica esperando a resposta do dono do projeto. Toda proposta pode ser aceita ou negada, quando negada deve ser também fornecido um motivo para sua rejeição. O dev pode cancelar sua proposta em até 3 dias após o aceite do gerente, se o cancelamento for realizado depois do aceite essa também deve acompanhar uma justificativa.
