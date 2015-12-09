require 'rspec'

class ChangeMaker
  def make_change(number)
    array = []
    quarter = (number / 25)
    dime = (number % 25) / 10
    nickel = ((number % 25) % 10) / 5
    penny = (((number % 25) % 10) % 5)
    array.concat(Array.new(quarter).fill(25)).concat(Array.new(dime).fill(10)).concat(Array.new(nickel).fill(5)).concat(Array.new(penny).fill(1))
  end
  def go
    (1..100).each do |number|
      p make_change(number)
    end
    return "done"
  end
end

RSpec.describe ChangeMaker do
  describe '#make_change' do
    it 'should return [1] if given 1' do
      change = ChangeMaker.new
      expect(change.make_change(1)).to eq([1])
    end
    it 'should return [1,1] if given 2' do
      change = ChangeMaker.new
      expect(change.make_change(2)).to eq([1,1])
    end

  end
  
end