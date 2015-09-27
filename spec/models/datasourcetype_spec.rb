require 'rails_helper'

RSpec.describe Datasourcetype, type: :model do
  it 'has a valid factory' do
    expect(build(:datasourcetype)).to be_valid
  end
  it "is invalid without a name" do
    expect(build(:datasourcetype, name: nil)).to be_invalid
  end
end
