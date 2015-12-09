require 'rspec'

class Change
  def make_change(number)
    quarter = (number / 25)
    dime = (number % 25) / 10
    nickel = ((number % 25) % 10) / 5
    penny = (((number % 25) % 10) % 5)

    return "#{quarter} quarter(s), #{dime} dime(s), #{nickel} nickel(s), #{penny} penny(ies)" if number >= 25
    return "#{dime} dime(s), #{nickel} nickel(s), #{penny} penny(ies)" if dime >= 1
    return "#{nickel} nickel(s), #{penny} penny(ies)" if nickel >= 1
    return "#{penny} penny(ies)"
  end
  def go
    (1..100).each do |number|
      puts make_change(number)
    end
  end
end

RSpec.describe Change do
  describe '#make_change' do
    it 'should return "1 penny(ies)" if given 1' do
      change = Change.new
      expect(change.make_change(1)).to eq("1 penny(ies)")
    end
    it 'should return "2 penny(ies)" if given 2' do
      change = Change.new
      expect(change.make_change(2)).to eq("2 penny(ies)")
    end
    it 'should return "1 nickel(s), 0 penny(ies)" if given 5' do
      change = Change.new
      expect(change.make_change(5)).to eq("1 nickel(s), 0 penny(ies)")
    end
    it 'should return "1 nickel(s), 1 penny(ies)" if given 6' do
      change = Change.new
      expect(change.make_change(6)).to eq("1 nickel(s), 1 penny(ies)")
    end
    it 'should return "1 nickel(s), 2 penny(ies)" if given 7' do
      change = Change.new
      expect(change.make_change(7)).to eq("1 nickel(s), 2 penny(ies)")
    end
    it 'should return "1 dime(s), 0 nickel(s), 0 penny(ies)" if given 10' do
      change = Change.new
      expect(change.make_change(10)).to eq("1 dime(s), 0 nickel(s), 0 penny(ies)")
    end
    it 'should return "1 dime(s), 0 nickel(s), 1 penny(ies)" if given 10' do
      change = Change.new
      expect(change.make_change(11)).to eq("1 dime(s), 0 nickel(s), 1 penny(ies)")
    end
    it 'should return "1 dime(s), 1 nickel(s), 0 penny(ies)" if given 15' do
      change = Change.new
      expect(change.make_change(15)).to eq("1 dime(s), 1 nickel(s), 0 penny(ies)")
    end
    it 'should return "1 quarter(s), 0 dime(s), 0 nickel(s), 0 penny(ies)" if given 25' do
      change = Change.new
      expect(change.make_change(25)).to eq("1 quarter(s), 0 dime(s), 0 nickel(s), 0 penny(ies)")
    end
    it 'should return "1 quarter(s), 0 dime(s), 0 nickel(s), 1 penny(ies)" if given 26' do
      change = Change.new
      expect(change.make_change(26)).to eq("1 quarter(s), 0 dime(s), 0 nickel(s), 1 penny(ies)")
    end
    it 'should return "1 quarter(s), 0 dime(s), 1 nickel(s), 0 penny(ies)" if given 30' do
      change = Change.new
      expect(change.make_change(30)).to eq("1 quarter(s), 0 dime(s), 1 nickel(s), 0 penny(ies)")
    end
    it 'should return "1 quarter(s), 1 dime(s), 0 nickel(s), 0 penny(ies)" if given 35' do
      change = Change.new
      expect(change.make_change(35)).to eq("1 quarter(s), 1 dime(s), 0 nickel(s), 0 penny(ies)")
    end
  end
  
end