# frozen_string_literal: true

require 'validate_response'

describe ValidateResponse do
  subject(:validate_response) { described_class.new }

  it 'should return true if input is 1 or 2' do
    expect(validate_response.game_mode?(1)).to eq(true)
    expect(validate_response.game_mode?(2)).to eq(true)
  end

  it 'should return false if input is not 1 or 2' do
    expect(validate_response.game_mode?('-1')).to eq(false)
    expect(validate_response.game_mode?('w')).to eq(false)
    expect(validate_response.game_mode?('!')).to eq(false)
  end
end
