# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:project) { Project.create(
      name: 'Groundhog Project',
      status: 1
    ) }

  let(:attributes) {
    {
      description: description,
      optimistic: optimistic,
      most_likely: most_likely,
      pessimistic: pessimistic,
      project_id: project.id
    }
  }

  describe 'Validations' do
    subject(:task) { described_class.new(attributes) }

    context 'when all required fields are sent' do
      let(:description) { 'Groundhog project' }
      let(:optimistic) { 3.0 }
      let(:most_likely) { 7.0 }
      let(:pessimistic) { 5.0 }

      it 'accepts the task' do
        task.valid?
        expect(task.errors.details).to be_empty
      end
    end

    context 'when description is not sent' do
      let(:description) { nil }
      let(:optimistic) { 3.0 }
      let(:most_likely) { 7.0 }
      let(:pessimistic) { 5.0 }

      it 'requires its presence' do
        expect(task).to be_invalid
        expect(task.errors.details[:description]).to include(a_hash_including(error: :blank))
      end
    end

    context 'when an optimistic estimative is not sent' do
      let(:description) { 'Groundhog project' }
      let(:optimistic) { nil }
      let(:most_likely) { 7.0 }
      let(:pessimistic) { 5.0 }

      it 'requires its presence before saving' do
        expect(task).to be_invalid
        expect(task.errors.details[:optimistic]).to include(error: :blank)
      end
    end
  end

  describe 'Defaults' do
    subject(:task) { described_class.new(attributes) }

    context 'when all three estimations are given' do
      let(:description) { 'Groundhog project' }
      let(:optimistic) { 3.0 }
      let(:most_likely) { 7.0 }
      let(:pessimistic) { 5.0 }

      it 'calculates the task\'s mean' do
        task.save
        expect(task.mean).to eq 6.0
      end

      it 'calculates the task\'s standard deviation' do
        task.save
        expect(task.standard_deviation).to eq 0.33
      end
    end
  end

  # describe 'Associations' do
  #   it 'belongs to a project' do

  #   end

  # end

  # describe 'Defaults' do

  # end
end