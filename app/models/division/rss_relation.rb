class Division::RssRelation < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'cont'      , name: '含む' },
    { id: 'not_cont'  , name: '含まない' }
  ]

  enum_accessor :id
end
