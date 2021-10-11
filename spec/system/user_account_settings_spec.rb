require 'rails_helper'

describe 'visitor' do
  it 'logs in as user' do
    user = User.create!(email: 'user@user.com', password: 123456)
    
    visit root_path
    click_on 'Entrar como Gerente de Projetos'
    fill_in 'E-mail', with: 'user@user.com'
    fill_in 'Senha', with: '123456'
    click_on 'Log in'
    
    expect(page).to have_content('Bem vindo user@user.com')
    expect(page).to have_link('Log out')
  end

  it 'logs out from user account' do
    user = User.create!(email: 'user@user.com', password: 123456)
    
    login_as user, scope: :user
    visit root_path
    click_on 'Log out'

    expect(page).to have_content('Bem vindo visitante, faça o login para navegar pelo site')
    expect(page).to have_link('Entrar como Gerente de Projetos')
    expect(page).not_to have_link('Log out')
    
  end

  it 'create account as user' do
    
    visit root_path
    click_on 'Entrar como Gerente de Projetos'
    click_on 'Sign up'
    fill_in 'E-mail', with: 'user@user.com'
    fill_in 'Senha', with: '123456'
    fill_in 'Confirme a senha', with: '123456'
    click_on 'Sign up'

    expect(page).to have_content('Bem vindo user@user.com')
    expect(page).to have_link('Log out')
    
  end
end
