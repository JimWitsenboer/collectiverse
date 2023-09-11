require 'rails_helper'

RSpec.describe "Orders", type: :request do
  # FactoryBot instances/attributes
  let(:user) { create(:user) }
  let(:toy) { create(:toy) }
  let(:order_attributes) { attributes_for(:order) }

  # Users need to be signed in by default to be able to executed the test successfully.
  before do
    sign_in user
  end

  describe 'Sales tests' do
    it 'renders the sales page' do
      get sales_path
      expect(response).to have_http_status(:ok)
    end

    it 'shows that user needs to be signed in to access the sales page' do
      sign_out user
      get sales_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'Purchases tests' do
    it 'renders the purchases page' do
      get purchases_path
      expect(response).to have_http_status(:ok)
    end
    it 'shows that user needs to be signed in to access the sales page' do
      sign_out user
      get purchases_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'New tests' do
    it 'renders the new order page' do
      get new_toy_order_path(toy_id: toy.id)
      expect(response).to have_http_status(:ok)
    end

    it 'shows that user needs to be signed in to access the sales page' do
      sign_out user
      get new_toy_order_path(toy_id: toy.id)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'Create tests' do
    it 'creates a new order' do
      expect {
        post toy_orders_path(toy_id: toy.id), params: { order: order_attributes }
      }.to change(Order, :count).by(1)
    end

    it 'redirects to purchases_path' do
      post toy_orders_path(toy_id: toy.id), params: { order: order_attributes }
      expect(response).to redirect_to(purchases_path)
    end

    it 'does not create a new order' do
      expect {
        post toy_orders_path(toy_id: toy.id), params: { order: { address: '' } }
      }.not_to change(Order, :count)
    end
  end

  describe 'Update tests' do
    let(:order) { create(:order, user: user) }

    it 'updates the order status' do
      patch order_path(order), params: { status: 'approved' }
      expect(order.reload.status).to eq('approved')
    end

    it 'redirects to sales_path' do
      patch order_path(order), params: { status: 'approved' }
      expect(response).to redirect_to(sales_path)
    end
  end
end
