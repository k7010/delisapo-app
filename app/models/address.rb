class Address < ActiveHash::Base
  self.data = [
    {id: 1, name: '---' },
    {id: 2, name: '東京都新宿区新宿'},
    {id: 3, name: '東京都新宿区歌舞伎町'}
  ]

  include ActiveHash::Associations
  has_many :baggages

end