require 'rails_helper'

describe 'visitor' do
  it 'logs in as dev' do
    dev = Dev.create!(email: 'dev@dev.com', password: 123456)

    login_as dev, scope: :dev
    visit root_path

    expect(page).to have_content('Bem vindo dev@dev.com')
    expect(page).to have_link('Log out')
  end

  it 'logs out from dev account' do
    
    dev = Dev.create!(email: 'dev@dev.com', password: 123456)

    login_as dev, scope: :dev
    visit root_path
    click_on 'Log out'

    expect(page).to have_content('Bem vindo visitante, faça o login para navegar pelo site')
    expect(page).to have_link('Entrar como Pessoa Desenvolvedora')
    expect(page).not_to have_link('Log out')
    
  end

  it 'create account as dev' do
    


    visit root_path
    click_on 'Entrar como Pessoa Desenvolvedora'
    click_on 'Sign up'
    fill_in 'E-mail', with: 'dev@dev.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme a senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Bem vindo dev@dev.com')
    
  end
end
