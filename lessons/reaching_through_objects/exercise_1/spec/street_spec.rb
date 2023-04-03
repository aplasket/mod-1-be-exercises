require 'spec_helper'

RSpec.describe Street do
 describe '#initialize' do
    it 'initializes' do
      adlington = Street.new("Adlington Road")

      expect(adlington).to be_a(Street)
      expect(adlington.name).to eq("Adlington Road")
    end


  end
end