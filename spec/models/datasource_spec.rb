require 'rails_helper'

RSpec.describe Datasource, type: :model do
  it 'has a valid factory' do
    expect(build(:datasource)).to be_valid
  end
  it "is invalid without a name" do
    expect(build(:datasource, name: nil)).to be_invalid
  end
end
