# frozen_string_literal: true

class Wine < ApplicationRecord
  belongs_to :user
  attachment :wine_image
  has_many :cheers, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def cheered_by?(user)
    cheers.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Wine.where(wine_name: content)
    elsif method == 'forward'
      Wine.where('wine_name LIKE ?', content+'%')
    elsif method == 'backward'
      Wine.where('wine_name LIKE ?', '%'+content)
    else
      Wine.where('wine_name LIKE ?', '%'+content+'%')
    end
  end

  validates :wine_name, presence: true

  enum kind: {
    ワインの種類を選択: '0',
    赤: '1',
    白: '2',
    ロゼ: '3',
    泡: '4',
    他の種類: '5'
  }

  enum country: {
    ワインの生産国を選択: '0',
    日本: '1',
    フランス: '2',
    イタリア: '3',
    スペイン: '4',
    ドイツ: '5',
    アメリカ: '6',
    オーストラリア: '7',
    アルゼンチン: '8',
    チリ: '9',
    その他の国: '10'
  }

  enum variety: {
    ぶどうの主な品種を選択: '0',
    カベルネ・ソーヴィニヨン: '1',
    メルロー: '2',
    ピノ・ノワール: '3',
    シラー: '4',
    グルナッシュ: '5',
    シャルドネ: '6',
    リースリング: '7',
    ソーヴィニヨン・ブラン: '8',
    甲州: '9',
    その他の品種: '10'
  }

  enum price: {
    ワインの価格帯を選択: '0',
    "0〜999円": '1',
    "1,000〜1,999円": '2',
    "2,000〜2,999円": '3',
    "3,000〜4,999円": '4',
    "5,000〜6,999円": '5',
    "7,000〜9,999円": '6',
    "10,000円以上": '7'
  }
end
