# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Cheerモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Cheer.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Wineモデルとの関係' do
      it 'N:1となっている' do
        expect(Cheer.reflect_on_association(:wine).macro).to eq :belongs_to
      end
    end
  end
end