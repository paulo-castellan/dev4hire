require 'rails_helper'

describe 'dev profile' do
  it 'fill succesfully' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    
    login_as dev, scope: :dev
    visit root_path
    click_on 'Editar perfil'
    fill_in 'Nome completo', with: 'João Moraes'
    fill_in 'Nome social', with: 'João Moraes'
    fill_in 'Data de nascimento', with: '20/06/1980'
    fill_in 'Formação educacional', with: 'Graduação em SI pela UFPE'
    fill_in 'Sobre você', with: 'Sou uma programador Back end com experiência em Rails'
    fill_in 'Experiência profissional', with: 'Estágio em empresa de TI com foco em debbug'
    click_on 'Cadastrar'

    expect(page).to have_content('Parabéns, seu perfil foi completado com sucesso')
    expect(page).not_to have_link('Log in')
    expect(page).to have_link('Log out')
  end
end