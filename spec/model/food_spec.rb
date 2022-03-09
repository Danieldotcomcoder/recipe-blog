require 'rails_helper'

RSpec.describe Food, type: :model do
    @user1 = User.create(name: 'Danny') 
    subject do Food.new(name: 'Food1', measurementUnit: 'Kg', Price: 5, user_id: @user1) 
    end

  before { subject.save }

  it "name should be less than 50 chars" do
    subject.name = 'hagdlihaygvdjashvgdajksyhdgvaiyhsgvdaisyhgvd;adadvkahda'
    expect(subject).to_not be_valid 
  end

  it "name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid 
  end

  it "Measurement Unit should be present" do
    subject.measurementUnit = nil 
    expect(subject).to_not be_valid 
  end

  it "Price should be present" do
    subject.Price = nil 
    expect(subject).to_not be_valid 
  end

  it "food should belong to user" do
    expect(subject.user_id).to eql (@user1)
  end

  it "Test instance of food" do
    expect(subject).to be_instance_of Food
  end

end