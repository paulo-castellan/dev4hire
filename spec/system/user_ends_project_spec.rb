require 'rails_helper'

describe 'User ends' do
  it 'project successfully' do
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
    
    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back-end'
    click_on 'Terminar projeto'

    expect(current_path).to eq(my_projects_projects_path)
    expect(page).to have_content('Suporte Back-end')
    expect(page).to have_content('Front-end Needed')

  end

  it 'hire team successfully' do
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
    
    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Aplicação web Front/Back-end'
    click_on 'Terminar recrutamento'

    expect(current_path).to eq(my_projects_projects_path)
    expect(page).to have_content('Encerrada a contratação de Devs')
  end
  
end