require 'rails_helper'

describe WorkType do
  context 'validations' do
    it 'description must be present' do
      work_type = WorkType.new
      work_type.valid?
      
      expect(work_type.errors.full_messages_for(:description)).to include('Tipo não pode ficar em branco')
    end
  end
end