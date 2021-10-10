require 'rails_helper'

describe 'dev view profile and' do
  it 'register an area of expertise' do
    dev = Dev.create!(email: 'dev@dev.com', password: '123456')
    
    login_as dev, scope: :dev
    visit root_path
    click_on 'Editar perfil'
    click_on 'Cadastrar área de atuação'
    fill_in 'Área de atuação', with: 'Dev back-end'
    click_on 'Cadastrar'

    expect(page).to have_content('Agora complete seu perfil')
    expect(Expertise.count).to eq(1)
    expect(current_path).to eq(new_dev_profile_path)
  end
end