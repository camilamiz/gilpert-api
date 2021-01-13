# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { described_class.new(attributes) }

  describe 'Validations' do
    describe 'description' do
      context 'when description is not sent' do
        let(:attributes) { { description: nil } }

        it 'requires a description' do
        end
      end

      context 'when description is sent' do
        let(:attributes) { { description: 'Code model specs' } }

        it 'saves the task' do

        end
      end
    end
  end

  describe 'Associations' do
    it 'belongs to a project' do

    end

  end


end