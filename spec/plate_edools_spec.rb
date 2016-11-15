# encoding: UTF-8
require 'spec_helper'

describe PlateEdools do
  let(:plate_valid) { "aaa-3081" }
  let(:plate_invalid) { "bwxp-1524" }
  let(:plate_blank) { "" }

  it "when a invalid plate" do
    expect(PlateEdools.plate(plate_invalid)).to be false
  end

  it "when a blank plate" do
    expect(PlateEdools.plate(plate_blank)).to be nil
  end

  it 'has a version number' do
    expect(PlateEdools::VERSION).not_to be nil
  end

  it "when a validate plate" do
    expect(PlateEdools.plate(plate_valid)).to be true
  end
end
