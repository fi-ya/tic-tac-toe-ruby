# frozen_string_literal: true

require 'input_validation'

describe InputValidation do
  subject(:input_validation) { described_class.new }

  it 'should return true if input is 1 or 2 for for game mode' do
    expect(input_validation.game_mode?(1)).to eq(true)
    expect(input_validation.game_mode?(2)).to eq(true)
  end

  it 'should return false if input is not 1 or 2 for game mode' do
    expect(input_validation.game_mode?('-1')).to eq(false)
    expect(input_validation.game_mode?('w')).to eq(false)
    expect(input_validation.game_mode?('!')).to eq(false)
  end

  it 'should return true if input is correct for replay game' do
    expect(input_validation.play_again?(1)).to eq(true)
    expect(input_validation.play_again?(2)).to eq(true)
  end

  it 'should return false if input is incorrect for replay game' do
    expect(input_validation.play_again?('-1')).to eq(false)
    expect(input_validation.play_again?('W')).to eq(false)
    expect(input_validation.play_again?('£')).to eq(false)
  end

  it 'should return true if custom marker input is not a single character' do
    expect(input_validation.not_single_char?('sa')).to eq(true)
    expect(input_validation.not_single_char?('AGFRE')).to eq(true)
    expect(input_validation.not_single_char?('DEW6ERdfs')).to eq(true)
  end

  it 'should return false if custom marker input is a single character' do
    expect(input_validation.not_single_char?('a')).to eq(false)
    expect(input_validation.not_single_char?('A')).to eq(false)
    expect(input_validation.not_single_char?('!')).to eq(false)
  end

  it 'should return true if custom marker input is a number' do
    expect(input_validation.number?('1')).to eq(true)
    expect(input_validation.number?('97')).to eq(true)
    expect(input_validation.number?('064')).to eq(true)
  end

  it 'should return false if custom marker input is a number' do
    expect(input_validation.number?('a')).to eq(false)
    expect(input_validation.number?('ASF')).to eq(false)
    expect(input_validation.number?('asd-sa')).to eq(false)
  end

  it 'should return true if custom marker input is same as computer X' do
    expect(input_validation.comp_marker?('X')).to eq(true)
  end

  it 'should return false if custom marker input is not X' do
    expect(input_validation.comp_marker?('!')).to eq(false)
    expect(input_validation.comp_marker?('--')).to eq(false)
  end

  it 'should return true if custom marker input is a valid input' do
    expect(input_validation.valid_custom_marker?('a')).to eq(true)
    expect(input_validation.valid_custom_marker?('!')).to eq(true)
    expect(input_validation.valid_custom_marker?('v')).to eq(true)
    expect(input_validation.valid_custom_marker?('X')).to eq(true)
  end

  it 'should return false if custom marker input is not a valid input' do
    expect(input_validation.valid_custom_marker?('aw')).to eq(false)
    expect(input_validation.valid_custom_marker?('!7')).to eq(false)
    expect(input_validation.valid_custom_marker?('1')).to eq(false)
  end

  it 'should return true if custom marker has already been taken' do
    expect(input_validation.marker_taken?('a', 'a')).to eq(true)
    expect(input_validation.marker_taken?('!', '!')).to eq(true)
    expect(input_validation.marker_taken?('1', '1')).to eq(true)
  end

  it 'should return false if custom marker has not been taken' do
    expect(input_validation.marker_taken?('a', 'b')).to eq(false)
    expect(input_validation.marker_taken?('!', '-')).to eq(false)
    expect(input_validation.marker_taken?('1', '2')).to eq(false)
  end

  it 'should return true if custom marker 2 meets validation critera' do
    expect(input_validation.valid_custom_marker2?('a', 'b')).to eq(true)
    expect(input_validation.valid_custom_marker2?('!', '-')).to eq(true)
    expect(input_validation.valid_custom_marker2?('O', 'X')).to eq(true)
  end

  it 'should return true if custom marker 2 meets validation critera' do
    expect(input_validation.valid_custom_marker2?('a', 'a')).to eq(false)
    expect(input_validation.valid_custom_marker2?('X', 'A')).to eq(false)
    expect(input_validation.valid_custom_marker2?('12', 'A')).to eq(false)
  end
end
