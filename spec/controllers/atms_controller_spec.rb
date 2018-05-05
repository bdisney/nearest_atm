require 'rails_helper'

RSpec.describe AtmsController, type: :controller do
  describe 'POST#create' do
    context 'with valid attributes' do
      let(:create_process) {
        process :create, method: :post, params: {
          atm: attributes_for(:atm, location: attributes_for(:location))
        }
      }

      it 'saves new atm to db' do
        expect { create_process }.to change(Atm, :count).by(1)
      end

      it 'redirects to home path' do
        create_process
        expect(response).to redirect_to home_path
      end
    end

    context 'with invalid attributes' do
      let(:create_process) {
        process :create, method: :post, params: {
          atm: attributes_for(:atm, location: attributes_for(:location, :invalid))
        }
      }

      it 'does not save atm to db' do
        expect { create_process }.to_not change(Atm, :count)
      end

      it 'renders new template' do
        create_process
        expect(response).to render_template :new
      end
    end
  end
end
