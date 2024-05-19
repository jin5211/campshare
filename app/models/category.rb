class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アウトドア テーブル、チェア、ハンモック' },
    { id: 3, name: 'アウトドア調理器具' },
    { id: 4, name: 'バーベキューアクセサリー' },
    { id: 5, name: 'キャンプテント' },
    { id: 6, name: 'アウトドア ライト、ランタン' },
    { id: 7, name: 'アウトドア 寝具' },
    { id: 8, name: 'その他' }
  ]
  end