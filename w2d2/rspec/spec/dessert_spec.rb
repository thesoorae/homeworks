require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new('cake', 50, chef)}
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
    expect(cake.type).to eq("cake")
    end


    it "sets a quantity" do
    expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
    expect(cake.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
    expect{ Dessert.new("cake", "yum") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
    expect(cake.ingredients).to_not include('flour')
    cake.add_ingredient('flour')
    expect(cake.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    expect(cake.mix!).to eq(cake.ingredients.shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
    expect(cake.eat(5)).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
    expect { cake.eat(100) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    expect(chef).to receive(:titleize)
    cake.serve
  end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    expect(chef).to receive(:bake).with(cake)
    cake.make_more
  end
  end
end
