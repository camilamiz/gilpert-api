# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  subject(:project) { described_class.new(attributes) }

  describe 'Validations' do
    describe 'name' do
      context 'when name is not sent' do
        let(:attributes) { { name: nil } }

        it 'requires a name' do
          expect(project).to be_invalid
          expect(project.errors.details[:name]).to include(a_hash_including(error: :blank))
        end
      end

      context 'when name is sent' do
        let(:attributes) { { name: 'Groundhog project' } }

        it 'does not save if name is already taken' do
          project.save
          project_with_same_name = project.dup

          expect { project_with_same_name.save! }.to raise_error(ActiveRecord::RecordInvalid)
        end

        it 'saves if name is unique' do
          expect{ project.save }.to change{ Project.count }.by(1)
        end
      end
    end
  end

  describe 'Defaults' do
    context 'when no attributes are given' do
      let(:attributes) { {} }

      it 'defines status as draft before validation' do
        expect { project.valid? }
          .to change { project.status }
          .from(nil).to('draft')
      end
    end

    context 'when attributes are given' do
      context 'and it is a status' do
        let(:attributes) { { status: :in_progress } }

        it 'defines status as in_progress' do
          expect(project.status).to eq('in_progress')
        end
      end
    end
  end

  describe 'Associations' do
    let(:attributes) {
      {
        name: 'Groundhog project',
        status: :in_progress
      }
    }

    it { should have_many(:tasks) }
  end
end
