require 'rails_helper'

describe 'dev profile' do
  it 'filled succesfully' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    back_end = Expertise.create!(field_of_expertise: 'Dev back-end')
    
    login_as dev, scope: :dev
    visit root_path
    fill_in 'Nome completo', with: 'João Moraes'
    fill_in 'Nome social', with: 'João Moraes'
    fill_in 'Data de nascimento', with: '20/06/1980'
    select 'Dev back-end', from: 'Área de atuação'
    fill_in 'Formação educacional', with: 'Graduação em SI pela UFPE'
    fill_in 'Sobre você', with: 'Sou uma programador Back end com experiência em Rails'
    fill_in 'Experiência profissional', with: 'Estágio em empresa de TI com foco em debbug'
    click_on 'Atualizar perfil'

    expect(page).to have_content('Parabéns, seu perfil foi atualizado com sucesso')
    expect(page).not_to have_link('Log in')
    expect(page).to have_link('Log out')
  end

  it 'are left with empty fields' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    expertise = Expertise.create!(field_of_expertise: 'Dev back-end')

    login_as dev, scope: :dev
    visit root_path
    click_on 'Atualizar perfil'

    expect(page).to have_content('Nome completo não pode ficar em branco')
    expect(page).to have_content('Nome social não pode ficar em branco')
    expect(page).to have_content('Data de nascimento não pode ficar em branco')
    expect(page).to have_content('Sobre você não pode ficar em branco')
    expect(page).to have_content('Formação educacional não pode ficar em branco')
    expect(page).to have_content('Experiência profissional não pode ficar em branco')
    expect(DevProfile.count).to eq(0)
  end

  it 'uses non-numbers value to fill date of birth' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    expertise = Expertise.create!(field_of_expertise: 'Dev back-end')

    login_as dev, scope: :dev
    visit root_path
    fill_in 'Nome completo', with: 'João Moraes'
    fill_in 'Nome social', with: 'João Moraes'
    select 'Dev back-end', from: 'Área de atuação'
    fill_in 'Data de nascimento', with: 'May 3rd of 1990'
    fill_in 'Formação educacional', with: 'Graduação em SI pela UFPE'
    fill_in 'Sobre você', with: 'Sou uma programador Back end com experiência em Rails'
    fill_in 'Experiência profissional', with: 'Estágio em empresa de TI com foco em debbug'
    click_on 'Atualizar perfil'

    expect(page).to have_content('Data de nascimento inválida')
    expect(DevProfile.count).to eq(0)
  end

  it 'is redirected to finish the profile' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    
    visit root_path
    click_on 'Entrar como Pessoa Desenvolvedora'
    fill_in 'E-mail', with: 'dev@dev.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'

    expect(current_path).to eq(new_dev_profile_path)
  end

  it 'is edited by dev' do
    dev = Dev.create!(email: 'dev@dev.com', password: 123456)
    expertise = Expertise.create!(field_of_expertise: 'Dev Back-end')
    dev_profile = DevProfile.create!(full_name: 'João Carlos', social_name: 'João Carlos',
                                    date_of_birth: '25/11/1987', academic_education: 'Formado em SI pela UFPE',
                                    previous_experience: 'Estágio com backend na XX consult',
                                    dev: dev, expertise: expertise, description: 'Desenvolvedor que curte a vida')
                                  
    login_as dev, scope: :dev
    visit root_path
    click_on 'Editar perfil'
    fill_in 'Nome social', with: 'Joana Medeiros'
    fill_in 'Nome social', with: 'Joana Medeiros'
    click_on 'Atualizar perfil'

    #expect(current_path).to eq(dev_profile_path)
    expect(page).to have_content('Joana Medeiros')
    expect(page).not_to have_css('.nome_social', text: 'João Carlos')
  end
end