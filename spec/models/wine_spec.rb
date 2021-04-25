# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Wineモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { wine.valid? }

    let(:user) { create(:user) }
    let!(:wine) { build(:wine, user_id: user.id) }

    context 'wine_nameカラム' do
      it '空欄でないこと' do
        wine.wine_name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Wine.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Cheerモデルとの関係' do
      it '1:Nとなっている' do
        expect(Wine.reflect_on_association(:cheers).macro).to eq :has_many
      end
    end
    
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Wine.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end