require 'rails_helper'

RSpec.describe AtmFilter do
  describe '#perform' do
    subject { described_class.new(params) }

    context 'when latitide and longitude is passed' do
      let(:params) do
        { 'latitude' => 22, 'longitude' => 33 }
      end

      let!(:atm_1) { create(:atm) }
      let!(:atm_2) { create(:atm) }

      it 'finds locations by latitude and longitude' do
        Rails.cache.clear
        expect(subject.perform.size).to eq(2)
        expect(subject.perform.first.atm_id).to eq(atm_1.id)
      end
    end

    context 'when latitide and longitude is not passed' do
      it 'returns nil' do
        expect(AtmFilter.new.perform).to be_nil
      end
    end
  end
end
