require 'rails_helper'


describe 'project propositon' do
  include ActiveSupport::Testing::TimeHelpers
  it 'is created by dev' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Declarar interesse de participação'
    fill_in 'Motivação', with: 'Além de estágio em back-end, tenho vários projetos independentes de front-end'
    fill_in 'Remuneração esperada', with: '100'
    fill_in 'Disponibilidade semanal (em horas)', with: '40'
    fill_in 'Expectativas', with: 'Desenvolver competências de Back/Front-end'
    click_on 'Submeter'

    expect(current_path).to eq(project_path(project))
    expect(page).to have_content('Parabéns, você declarou interesse no projeto Aplicação web Front/Back')
    expect(page).to have_content('Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('10/12/2021')
    expect(page).to have_content('R$ 200,00')
    expect(page).not_to have_link('Declarar interesse de participação')
  end
  
  it 'cannot have empty fields' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Declarar interesse de participação'
    click_on 'Submeter'

    expect(page).to have_content ('Motivação não pode ficar em branco')
    expect(page).to have_content ('Remuneração esperada não pode ficar em branco')
    expect(page).to have_content ('Disponibilidade semanal (em horas) não pode ficar em branco')
    expect(page).to have_content ('Expectativas não pode ficar em branco') 
  end

  it 'cannot have expected payment and available hours per weer with 0 or less' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Declarar interesse de participação'
    fill_in 'Motivação', with: 'Além de estágio em back-end, tenho vários projetos independentes de front-end'
    fill_in 'Remuneração esperada', with: '0'
    fill_in 'Disponibilidade semanal (em horas)', with: '-40'
    fill_in 'Expectativas', with: 'Desenvolver competências de Back/Front-end'
    click_on 'Submeter'

    expect(page).to have_content ('Disponibilidade semanal (em horas) deve ser maior que 0')
    expect(page).to have_content ('Remuneração esperada deve ser maior que 0')
    
  end
  
=begin
  it 'cannot create two project propositions for the same project' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)
    ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                              available_hours_per_week: 30, expectations: 'Desenvolver minhas habilidades de dev',
                              dev: jonas, project: project)
    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Declarar interesse de participação'
    fill_in 'Motivação', with: 'Além de estágio em back-end, tenho vários projetos independentes de front-end'
    fill_in 'Remuneração esperada', with: '100'
    fill_in 'Disponibilidade semanal (em horas)', with: '40'
    fill_in 'Expectativas', with: 'Desenvolver competências de Back/Front-end'
    click_on 'Submeter'

    expect(page).to have_content('Não podem existir duas propostas para o mesmo projeto')
  end
=end

  it 'is denied by the user and it is seem by the dev' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    peter = User.create!(email: 'peter@parker.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: peter)
    project_proposition = ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                                                    available_hours_per_week: 30, dev: jonas, project: project,
                                                    expectations: 'Desenvolver minhas habilidades de dev',
                                                    rejection_motive: 'Seu perfil não se enquadra nas necessidades')

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Veja suas propostas'

    expect(page).to have_content('Seu perfil não se enquadra nas necessidades')
  end

  it 'is cancelled by the dev before 3 days time' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    peter = User.create!(email: 'peter@parker.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: peter)
    project_proposition = ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                                                    available_hours_per_week: 30, dev: jonas, project: project,
                                                    expectations: 'Desenvolver minhas habilidades de dev')

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Veja suas propostas'
    fill_in 'Motivo do cancelamento', with: 'Encontrei outra proposta, não tenho mais disponibilidade' 
    click_on 'Cancelar proposta'

    expect(current_path).to eq(project_project_propositions_path(project_proposition.project.id))
    expect(page).to have_content('Você cancelou a proposta')
  end

  it 'cannot be canceled by dev after 3 days' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    peter = User.create!(email: 'peter@parker.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: peter)
    travel_to 5.days.ago do
      project_proposition = ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                                                      available_hours_per_week: 30, dev: jonas, project: project,
                                                      expectations: 'Desenvolver minhas habilidades de dev', accepted_time: Date.today)
    end

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Veja suas propostas'
    fill_in 'Motivo do cancelamento', with: 'Encontrei outra proposta, não tenho mais disponibilidade' 
    click_on 'Cancelar proposta'

    expect(page).to have_content('Você não pode cancelar o projeto depois de 3 dias após o aceite')
  end
  
  it 'after accepted sees project team' do
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    user = User.create!(email: 'peter@parker.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    jonas_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    peter = Dev.create!(email: 'peter@parker.com', password: 123456)
    peter_profile = DevProfile.create!(full_name: 'Peter Parker', social_name: 'Spider-man',
                                    date_of_birth: '14/05/1995', academic_education: 'Curso tecnológico em computação',
                                    previous_experience: 'Freelancer em vários pequenos projetos',
                                    dev: peter, expertise: expertise, description: 'Nascido para vencer e codar')
    jane = Dev.create!(email: 'jane@doe.com', password: 123456)
    jane_profile = DevProfile.create!(full_name: 'Jane Doe', social_name: 'Fake Woman',
                                      date_of_birth: '05/03/1978', academic_education: 'Graduação, Mestrado e Doutorado em aplicações web de alto rendimento',
                                      previous_experience: 'Multiplas empresas de tecnólogia, 20 anos de experiência em desenvolvimento Web',
                                      dev: jane, expertise: expertise, description: 'Codo e vivo a vida, a muito tempo')
    ProjectProposition.create!(motivation: 'Quero dinheiro', expected_payment: 200,
                                        available_hours_per_week: 30, expectations: 'Desenvolver minhas habilidades de dev',
                                        dev: jonas, project: project)
    ProjectProposition.create!(motivation: 'Em busca de aprender a codar mais e melhor todos dias', expected_payment: 100,
                                        available_hours_per_week: 30, expectations: 'Estou em transição de carreira, espero uma equipe que me ajude a crescer',
                                        dev: peter, project: project, accepted_time: 2.days.ago, status: 'accepted')
    ProjectProposition.create!(motivation: 'Tempo disponível, estou em busca de novos projetos', expected_payment: 800,
                                        available_hours_per_week: 10, expectations: 'Conhecer novos devs, e coordenar equipes com variada capacidade',
                                        dev: jane, project: project, accepted_time: 1.day.ago, status: 'accepted')


    login_as peter, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'

    expect(page).to have_content('Equipe aceita para esse projeto')
    expect(page).to have_content('Peter Parker')
    expect(page).to have_content('Jane Doe')
    expect(page).not_to have_content('João Carlos')
    
  end
end