require 'rails_helper'

describe Expertise do
  context 'validations' do
    it 'field of expertise must be present' do
      expertise = Expertise.new
      expertise.valid?
      
      expect(expertise.errors.full_messages_for(:field_of_expertise)).to include('Área de atuação não pode ficar em branco')
    end
  end
end