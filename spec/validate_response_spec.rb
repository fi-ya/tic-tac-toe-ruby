# frozen_string_literal: true

require 'validate_response'

describe ValidateResponse do
  subject(:validate_response) { described_class.new }

  it 'should return true if input is 1 or 2 for for game mode' do
    expect(validate_response.game_mode?(1)).to eq(true)
    expect(validate_response.game_mode?(2)).to eq(true)
  end

  it 'should return false if input is not 1 or 2 for game mode' do
    expect(validate_response.game_mode?('-1')).to eq(false)
    expect(validate_response.game_mode?('w')).to eq(false)
    expect(validate_response.game_mode?('!')).to eq(false)
  end

  it 'should return true if input is correct for replay game' do
    expect(validate_response.play_again?(1)).to eq(true)
    expect(validate_response.play_again?(2)).to eq(true)
  end

  it 'should return false if input is incorrect for replay game' do
    expect(validate_response.play_again?('-1')).to eq(false)
    expect(validate_response.play_again?('W')).to eq(false)
    expect(validate_response.play_again?('£')).to eq(false)
  end

  it 'should return true if custom marker input is not a single character' do
    expect(validate_response.is_not_single_char?('sa')).to eq(true)
    expect(validate_response.is_not_single_char?('AGFRE')).to eq(true)
    expect(validate_response.is_not_single_char?('DEW6ERdfs')).to eq(true)
  end

  it 'should return false if custom marker input is a single character'  do
    expect(validate_response.is_not_single_char?('a')).to eq(false)
    expect(validate_response.is_not_single_char?('A')).to eq(false)
    expect(validate_response.is_not_single_char?('!')).to eq(false)
  end

  it 'should return true if custom marker input is a number' do
    expect(validate_response.is_number?('1')).to eq(true)
    expect(validate_response.is_number?('97')).to eq(true)
    expect(validate_response.is_number?('064')).to eq(true)
  end

  it 'should return false if custom marker input is a number' do
    expect(validate_response.is_number?('a')).to eq(false)
    expect(validate_response.is_number?('ASF')).to eq(false)
    expect(validate_response.is_number?('asd-sa')).to eq(false)
  end

  it 'should return true if custom marker input is same as computer #' do
    expect(validate_response.is_comp_marker?('#')).to eq(true)
  end

  it 'should return false if custom marker input is not #' do
    expect(validate_response.is_comp_marker?('!')).to eq(false)
    expect(validate_response.is_comp_marker?('--')).to eq(false)
  end

  it 'should return true if custom marker input is a valid input' do
    expect(validate_response.valid_custom_marker?('a')).to eq(true)
    expect(validate_response.valid_custom_marker?('!')).to eq(true)
    expect(validate_response.valid_custom_marker?('v')).to eq(true)
  end
  
  it 'should return false if custom marker input is not a valid input' do
    expect(validate_response.valid_custom_marker?('aw')).to eq(false)
    expect(validate_response.valid_custom_marker?('!7')).to eq(false)
    expect(validate_response.valid_custom_marker?('1')).to eq(false)
    expect(validate_response.valid_custom_marker?('#')).to eq(false)
  end
end
