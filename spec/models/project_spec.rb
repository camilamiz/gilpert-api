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
          # expect(insured_person.errors.details[:name]).to include(a_hash_including(error: :blank))
        end
      end
    end

  end
end