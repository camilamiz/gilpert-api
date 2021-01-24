# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  fixtures :projects
  subject(:project) { projects(:project) }
  fixtures :tasks


  describe 'Associations' do
    context 'has many tasks' do
      it { should respond_to(:tasks) }
    end
  end

  describe 'Validations' do
    describe 'name' do
      context 'when name is not sent' do
        it 'requires a name' do
          project.name = nil
          expect(project).to be_invalid
          expect(project.errors.details[:name]).to include(a_hash_including(error: :blank))
        end
      end

      context 'when name is sent' do
        it 'is not valid if name is already taken' do
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

    describe 'status' do
      context 'when in_progress' do
        context 'mean_total' do
          context 'is not present' do
            it 'requires its presence' do

            end
          end

          context 'is present' do
            it 'is the sum of tasks\'  means' do

            end
          end
        end

        context 'standard_deviation' do
          context 'is not present' do
            it 'requires its presenc' do

            end
          end
          context 'is present' do
            it 'is the square root of tasks\' standard_deviations sum' do

            end
          end
        end

        context 'started_at' do
          context 'is not present' do
            it 'requires its presence' do

            end

            it 'is the same as the first task to start' do

            end
          end
        end
      end

      context 'when finished' do
        context 'actual_duration' do
          context 'is not present' do
            it 'requires its presence' do

            end
          end

          context 'is present' do
            it 'is the sum of tasks\' actual sum' do

            end
          end
        end

        context 'ended_at' do
          context 'is not present' do
            it 'requires its presence' do

            end
          end

          context 'is present' do
            it 'is started_at plus actual duration' do

            end

            it 'is the same as the last task to end' do

            end
          end
        end
      end
    end
  end

  describe 'Defaults' do
    let(:new_project) { described_class.new(attributes) }

    context 'when no attributes are given' do
      let(:attributes) { {} }

      it 'defines status as draft before validation' do
        expect { new_project.valid? }
          .to change { new_project.status }
          .from(nil).to('draft')
      end
    end

    context 'when attributes are given' do
      context 'and it is a status' do
        let(:attributes) { { status: :in_progress } }

        it 'defines status as in_progress' do
          expect(new_project.status).to eq('in_progress')
        end
      end
    end
  end
end
