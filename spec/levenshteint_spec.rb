require 'spec_helper'

describe Levenshteint do
  fixtures = [
    [[1], [1], 0],
    [[1], [2], 1],
    [[1], [3], 1],
    [[1], [4], 1],
    [[1], [5], 1],
    [[1], [6, 3], 2],
    [[1], [7, 3, 4, 1], 3],
    [[1], [8, 2, 3, 3, 3], 5],
    [[1], [9, 2, 3, 5, 6], 5],
  ]

  fixtures.each do |w1, w2, d|
    it "should calculate a distance of #{d} between #{w1} and #{w2}" do
      Levenshteint.distance(w1, w2).should == d
      Levenshteint.distance(w2, w1).should == d
    end
  end

  it "should raise an error if either argument is nil" do
    expect { Levenshteint.distance([1], nil) }.to raise_error TypeError
    expect { Levenshteint.distance(nil, [1]) }.to raise_error TypeError
  end

  it "should raise an error if either argument is something else than an array of strings" do
    expect { Levenshteint.distance([2], /woah/) }.to raise_error TypeError
    expect { Levenshteint.distance(5.3, [3]) }.to raise_error TypeError
    expect { Levenshteint.distance(Object.new, [1]) }.to raise_error TypeError
  end
end
