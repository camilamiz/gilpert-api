# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculateMean, type: :model do
  context 'when given a set of values' do
    let(:number_set) { [1.4, 3.5, 7.0] }

    it 'calculates the mean' do
      expect(CalculateMean.new(number_set).execute).to eq 3.97
    end
  end
end
