require 'rails_helper'

describe 'work type' do
  it 'created by user' do
    user = User.create!(email: 'user@user.com', password: 123456)

    login_as user, scope: :user
    visit root_path
    click_on 'Área de projetos'
    click_on 'Adicionar uma Modalidade de Trabalho'
    fill_in 'Tipo', with: 'Remoto'
    click_on 'Cadastrar Nova modalidade de trabalho'

    expect(current_path).to eq(projects_path)
    expect(WorkType.count).to eq(1)
  end
end