# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Validations' do
    subject(:project) { described_class.new(attributes) }

    describe 'name' do
      let(:attributes) { { name: name } }

      context 'when name is not sent' do
        let(:name) { nil }

        it 'requires a name' do
          expect(project).to be_invalid
          expect(project.errors.details[:name]).to include(a_hash_including(error: :blank))
        end
      end

      context 'when name is sent' do
        let(:name) { 'Groundhog Project' }

        it 'is not valid if name is already taken' do
          project.save
          project_with_same_name = project.dup

          expect(project_with_same_name).to be_invalid
          expect(project_with_same_name.errors.messages[:name]).to eq(["has already been taken"])
        end

        it 'is valid if name is unique' do
          project_with_different_name = project.dup
          project_with_different_name.name = 'Back to the future'

          expect(project_with_different_name).to be_valid
        end
      end
    end

    describe 'mean_total' do
      context ' when project hasn\'t got any tasks' do
        it 'is nil' do
          expect(project.mean_total).to be_nil
        end
      end
    end
  end

  describe 'Defaults' do
    subject(:project) { described_class.new(attributes) }

    context 'when no attributes are given' do
      let(:attributes) { {} }

      it 'defines status as draft before validation' do
        expect(project.status).to eq('draft')
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
end
