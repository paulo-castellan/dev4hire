require 'rails_helper'

describe DevProfile do
  context 'validations' do
    it 'full_name must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:full_name)).to include('Nome completo não pode ficar em branco')
    end

    it 'social_name must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:social_name)).to include('Nome social não pode ficar em branco')
    end

    it 'date_of_birth_name must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:date_of_birth)).to include('Data de nascimento não pode ficar em branco')
    end

    it 'academic_education must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:academic_education)).to include('Formação educacional não pode ficar em branco')
    end

    it 'previous_experience must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:previous_experience)).to include('Experiência profissional não pode ficar em branco')
    end

    it 'description must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?
      
      expect(dev_profile.errors.full_messages_for(:description)).to include('Sobre você não pode ficar em branco')
    end

    it 'expertise must be present' do
      dev_profile = DevProfile.new
      dev_profile.valid?

      expect(dev_profile.errors.full_messages_for(:expertise)).to include('Expertise é obrigatório(a)')
    end
  end
end
