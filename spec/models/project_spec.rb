require 'rails_helper'

describe Project do
  include ActiveSupport::Testing::TimeHelpers
  context 'validations' do
    it 'title must be present' do
      project = Project.new
      project.valid?
      
      expect(project.errors.full_messages_for(:title)).to include('Título não pode ficar em branco')
    end

    it 'detailed description must be present' do
      project = Project.new
      project.valid?
      
      expect(project.errors.full_messages_for(:detailed_description)).to include('Descrição detalhada não pode ficar em branco')
    end

    it 'skill sets  must be present' do
      project = Project.new
      project.valid?
      
      expect(project.errors.full_messages_for(:skill_sets)).to include('Habilidades desejadas não pode ficar em branco')
    end

    it 'max payment per hour description must be present' do
      project = Project.new
      project.valid?
      
      expect(project.errors.full_messages_for(:max_payment_per_hour)).to include('Remuneração máxima (por hora) não pode ficar em branco')
    end

    it 'hire date limit must be present' do
      project = Project.new
      project.valid?
      
      expect(project.errors.full_messages_for(:hire_date_limit)).to include('Data limite para inscrição não pode ficar em branco')
    end
  end
  context 'should not be valid' do
    it 'cannot register a project to hire date limit is the pass' do
      work_type = WorkType.create!(description: 'Remoto')
      user = User.create!(email: 'user@user.com', password: 123456)
      project = Project.new(title: 'Aplicação web Front/Back', skill_sets: 'Ruby on Rails',
                            max_payment_per_hour: '200',
                            detailed_description: 'Nesse projeto as equipes vão estar envolvidas na construção de uma aplicação web para uma grande empresa de mineração',
                            work_type: work_type, user: user)
      
      travel_to 1.month.ago do
        project.hire_date_limit = 5.days.from_now
      end
      
      expect(project.valid?).to eq(false)
    end
  end
end
