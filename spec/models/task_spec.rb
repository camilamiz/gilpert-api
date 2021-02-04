# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { described_class.new(attributes) }
  let(:project) { Project.create(
      name: 'Groundhog Project',
      status: 1
    ) }

  describe 'Validations' do
    context 'when all required fields are sent' do
      let(:attributes) {
        {
          description: 'Groundhog task',
          optimistic: 3,
          most_likely: 5,
          pessimistic: 7,
          project_id: project.id
        }
      }

      it 'accepts the task' do
        task.valid?
        expect(task.errors.details).to be_empty
      end
    end

  #   context 'when description is not sent' do
  #     let(:attributes) { { description: nil } }

  #     it 'requires a description' do
  #       debugger
  #       expect(task).to be_invalid
  #       expect(task.errors.details[:description]).to include(a_hash_including(error: :blank))
  #     end
  #   end

  #     context 'when description is sent' do
  #       let(:attributes) { { description: 'Groundhog task' } }

  #       it 'saves the task' do
  #         debugger

  #       end
  #     end
  # end

  # describe 'Associations' do
  #   it 'belongs to a project' do

  #   end

  # end

  # describe 'Defaults' do

  # end
end