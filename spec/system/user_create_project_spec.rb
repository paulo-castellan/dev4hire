require 'rails_helper'

describe 'user project' do
  it 'is created' do
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')

    login_as user, scope: :user
    visit root_path
    click_on 'Área de Gerência de Projetos'
    click_on 'Criar novo projeto'
    fill_in 'Título', with: 'Aplicação web Front/Back'
    fill_in 'Descrição detalhada', with: 'Nesse projeto as equipes vão estar envolvidas na construção de uma
    aplicação web para uma grande empresa de mineração que faz a exploração de ouro em várias localidades do brasil,
    será necessário Devs Full-Stack para fazerem coordenação de microequipes, Devs back e front-end que seram distribuidos
    de acordo com suas competências para a as equipes, o projeto será desenvolvido em Ruby on Rails nas versões mais atuais,
    no back-end e REACT JS para front-end, essas tecnologias são imperativas para a equipe. Vem trabalha nesse projeto conosco!'
    fill_in 'Habilidades desejadas', with: 'Ruby on Rails, React, HTML/CSS, facil comunicação interpessoal'
    fill_in 'Remuneração máxima (por hora)', with: '200'
    fill_in 'Data limite para inscrição', with: '10/12/2021'
    select 'Remoto', from: 'Modalidade de trabalho'
    click_on 'Cadastrar Projeto'

    expect(current_path).to eq(projects_path)
    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('2021-12-10')
  end
end