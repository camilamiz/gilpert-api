# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Validations' do
    subject(:project) { described_class.new(attributes) }

    describe 'name' do
      context 'when name is not sent' do
        let(:attributes) { { name: nil } }

        it 'requires a name' do
          expect(project).to be_invalid
          expect(project.errors.details[:name]).to include(a_hash_including(error: :blank))
        end
      end

      context 'when name is sent' do
        let(:attributes) { { name: 'Groundhog project' } }\

        it 'does not save if name is already taken' do
        end

        it 'saves if name is not taken yet' do
        end
      end
    end
  end
end

# todo - use change block for active record validation in project model