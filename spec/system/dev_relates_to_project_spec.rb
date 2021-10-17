require 'rails_helper'

describe 'Dev' do
  include ActiveSupport::Testing::TimeHelpers
  it 'find a project' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    user = User.create!(email: 'user@user.com', password: 123456)
    work_type = WorkType.create!(description: 'Remoto')
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021', max_payment_per_hour: '200', work_type: work_type, user: user)

    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    
    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('10/12/2021')
    expect(page).to have_content('R$ 200,00')
  end

  it 'clicks on a specific project to see details' do
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

    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('10/12/2021')
    expect(page).to have_content('R$ 200,00')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('Gerente do projeto: user@user.com')
  end

  it 'cannot find project that have hire date limit before atual date' do
    dev = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: dev, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    work_type = WorkType.create!(description: 'Remoto')
    user = User.create!(email: 'user@user.com', password: 123456)
    project = Project.create!(title: 'Aplicação web Front/Back', detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '12/12/2023', max_payment_per_hour: '200', work_type: work_type, user: user)
    travel_to 6.days.ago do
      project2 = Project.create!(title: 'Suporte Backend', detailed_description: 'Esse projeto necessita de uma grande quantidade de dev back-end para expansão de aplicação web',
                                skill_sets: 'Laravel/Node.js', hire_date_limit: 3.days.from_now, max_payment_per_hour: '500', work_type: work_type, user: user)
    end

    login_as dev, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    
    expect(page).to have_content('Aplicação web Front/Back')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('12/12/2023')
    expect(page).to have_content('R$ 200,00')
    expect(page).not_to have_content('Suporte Backend')
    expect(page).not_to have_content('Laravel/Node.js')
    expect(page).not_to have_content(5.days.ago)
    expect(page).not_to have_content('R$ 500,00')
  end

  it 'searches for a project' do
    jonas = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: jonas, expertise: expertise, description: 'Desenvolvedor que curte a vida')
    work_type = WorkType.create!(description: 'Remoto')
    user = User.create!(email: 'user@user.com', password: 123456)
    project = Project.create!(title: 'Aplicação web Front/Back-end', detailed_description: 'Nesse projeto equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                              skill_sets: 'Ruby on Rails', hire_date_limit: '10/12/2021',
                              max_payment_per_hour: '200', work_type: work_type, user: user)
    project2 = Project.create!(title: 'Suporte Back-end', detailed_description: 'Esse projeto necessita de uma grande quantidade de dev back-end para expansão de aplicação web',
                                skill_sets: 'Laravel/Node.js', hire_date_limit: 3.days.from_now,
                                max_payment_per_hour: '500', work_type: work_type, user: user)
    project3 = Project.create!(title: 'Front-end Needed', detailed_description: 'Estamos procurando por Devs freelancers para realizarem a criação de telas temáticas URGENTE!',
                                  skill_sets: 'React JS/Vue JS', hire_date_limit: 3.days.from_now,
                                  max_payment_per_hour: '150', work_type: work_type, user: user)
    
    login_as jonas, scope: :dev
    visit root_path
    click_on 'Área de projetos'
    fill_in 'Buscar', with: 'Back-end'
    click_on 'Buscar'

    expect(page).to have_content('Aplicação web Front/Back-end')
    expect(page).to have_content('Suporte Back-end')
    expect(page).not_to have_content('Front-end Needed')
    expect(page).not_to have_content('React JS')
  end
end