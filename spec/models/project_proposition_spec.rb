require 'rails_helper'

describe ProjectProposition do
  context 'validations' do
    it 'motivation must be present' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:motivation)).to include('Motivação não pode ficar em branco')
    end

    it 'expected payment must be present' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:expected_payment)).to include('Remuneração esperada não pode ficar em branco')
    end

    it 'available hours per week must be present' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:available_hours_per_week)).to include('Disponibilidade semanal (em horas) não pode ficar em branco')
    end

    it 'expectations must be present' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:expectations)).to include('Expectativas não pode ficar em branco')
    end
    
    it 'expected payment must be present' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:expected_payment)).to include('Remuneração esperada não pode ficar em branco')
    end

    it 'expected payment must be a number' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:expected_payment)).to include('Remuneração esperada não é um número')
    end

    it 'expected payment must be bigger than 0' do
      project_proposition = ProjectProposition.new(expected_payment: '-1')
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:expected_payment)).to include('Remuneração esperada deve ser maior que 0')
    end

    it 'available hours per week must be a number' do
      project_proposition = ProjectProposition.new
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:available_hours_per_week)).to include('Disponibilidade semanal (em horas) não é um número')
    end

    it 'available hours per week must be bigger than 0' do
      project_proposition = ProjectProposition.new(available_hours_per_week: '-1')
      project_proposition.valid?
      
      expect(project_proposition.errors.full_messages_for(:available_hours_per_week)).to include('Disponibilidade semanal (em horas) deve ser maior que 0')
    end
  end
end
