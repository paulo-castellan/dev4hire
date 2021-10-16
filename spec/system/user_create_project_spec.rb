require 'rails_helper'

describe 'user project' do
  it 'is created' do
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')

    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
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
    expect(page).to have_content('10/12/2021')
  end

  it 'are viewed' do
    work_type = WorkType.create!(description: 'Remoto')
    jane = User.create!(email: 'jane@doe.com', password: 123456)
    peter = User.create!(email: 'peter@parker.com', password: 123456)
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit:'10/12/2022',
                              max_payment_per_hour: '200', work_type: work_type, user: jane)
    project2 = Project.create!(title: 'Suporte Backend', detailed_description: 'Esse projeto necessita de uma grande quantidade de dev back-end para expansão de aplicação web',
                              skill_sets: 'Laravel/Node.js', hire_date_limit: 3.days.from_now,
                              max_payment_per_hour: '500', work_type: work_type, user: peter)
    
    login_as jane, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Meus projetos'

    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('10/12/2022')
    expect(page).not_to have_content('Suporte Backend')
    expect(page).not_to have_content('Laravel/Node.js')
    expect(page).not_to have_content(3.days.from_now)
  end

  it 'cannot be created with empty fields' do
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')

    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Criar novo projeto'
    click_on 'Cadastrar Projeto'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição detalhada não pode ficar em branco')
    expect(page).to have_content('Habilidades desejadas não pode ficar em branco')
    expect(page).to have_content('Remuneração máxima (por hora) não pode ficar em branco')
    expect(page).to have_content('Data limite para inscrição não pode ficar em branco')
    expect(current_path).to eq(projects_path)
  end

  it 'cannot be created with an invalid hire date limit' do
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')

    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Criar novo projeto'
    fill_in 'Título', with: 'Aplicação web Front/Back'
    fill_in 'Descrição detalhada', with: 'Nesse projeto as equipes vão estar envolvidas na construção de uma
    aplicação web para uma grande empresa de mineração que faz a exploração de ouro em várias localidades do brasil,
    será necessário Devs Full-Stack para fazerem coordenação de microequipes, Devs back e front-end que seram distribuidos
    de acordo com suas competências para a as equipes, o projeto será desenvolvido em Ruby on Rails nas versões mais atuais,
    no back-end e REACT JS para front-end, essas tecnologias são imperativas para a equipe. Vem trabalha nesse projeto conosco!'
    fill_in 'Habilidades desejadas', with: 'Ruby on Rails, React, HTML/CSS, facil comunicação interpessoal'
    fill_in 'Remuneração máxima (por hora)', with: '200'
    fill_in 'Data limite para inscrição', with: 5.days.ago
    select 'Remoto', from: 'Modalidade de trabalho'
    click_on 'Cadastrar Projeto'

    expect(Project.count).to eq(0)
    expect(page).to have_content('Data limite para inscrição não pode ser em datas passadas')
  end
end