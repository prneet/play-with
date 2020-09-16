class Style < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カジュアル' },
    { id: 1, name: 'ランクマッチ' },
    { id: 2, name: '初心者' },
    { id: 3, name: 'エンジョイ' },
  ]
end