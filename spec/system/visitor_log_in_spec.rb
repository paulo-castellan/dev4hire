require 'rails_helper'

describe 'visitor' do
  it 'visit homepage' do
    visit root_path

    expect(page).to have_content('Bem-vindo ao Dev4Hire')
  end
end
