require 'rails_helper'

describe 'user sees projects propositions' do
  it 'and do nothing' do
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
    
    login_as peter, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'

    expect(page).to have_content('João Carlos')
    expect(page).to have_content('Quero dinheiro')
    expect(page).to have_content('R$ 200,00')
    expect(page).to have_content('Horas por semana: 30')
    expect(page).to have_content('Desenvolver minhas habilidades de dev')
  end

  it 'and accepts it' do
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
    
    login_as peter, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Aceitar proposta'

    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Ruby on Rails')
    expect(page).not_to have_link('Rejeitar proposta')
    expect(page).not_to have_link('Aceitar proposta')
  end

  it 'and denies it' do
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
    
    login_as peter, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    fill_in 'Motivo da rejeição', with: 'Seu perfil não se enquadra no projeto'
    click_on 'Rejeitar proposta'
    
    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Ruby on Rails')
    expect(page).not_to have_link('Aceitar proposta')
    expect(page).not_to have_link('Rejeitar proposta')
  end

  it 'cannot deny if does not pass a rejection motive' do
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
    
    login_as peter, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back'
    click_on 'Rejeitar proposta'
    
    expect(page).to have_content('Motivo da rejeição deve ser fornecido')
  end
end