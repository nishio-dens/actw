class Division::RssConditionKey < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'title'        , name: 'タイトル' },
    { id: 'author_name'  , name: '著者名' },
    { id: 'tag'          , name: 'タグ' }
  ]

  enum_accessor :id
end
