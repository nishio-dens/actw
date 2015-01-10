class Division::SearchPredicate < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'cont'      , name: '含む' },
    { id: 'eq'        , name: '完全一致する' }
  ]

  enum_accessor :id
end
