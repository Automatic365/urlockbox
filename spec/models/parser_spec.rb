require 'rails_helper'

RSpec.describe Parser do
  it 'should initialize with a parsed input' do
    link = Parser.new('http://www.example.com \:cc kp@knicks.com')

    expect(link.parsed_input).to eq ['http://www.example.com', '\:cc', 'kp@knicks.com']
  end

  it 'should return a url' do
    link = Parser.new('http://www.example.com \:cc kp@knicks.com')

    expect(link.url).to eq 'http://www.example.com'
  end

  it 'should return a command' do
    link = Parser.new('http://www.example.com \:cc kp@knicks.com')

    expect(link.command).to eq '\:cc'
  end

  it 'should return a recipient' do
    link = Parser.new('http://www.example.com \:cc kp@knicks.com')

    expect(link.recipient).to eq 'kp@knicks.com'
  end

  it 'should approve emails with a proper command' do
    link = Parser.new('http://www.example.com \:cc kp@knicks.com')

    expect(link.should_be_emailed?).to eq true
  end

  it 'should not approve emails without a proper command ' do
    link = Parser.new('http://www.example.com hi kp@knicks.com')

    expect(link.should_be_emailed?).to eq false
  end
end
