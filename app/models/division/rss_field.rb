class Division::RssField < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'title'        , name: 'タイトル' },
    { id: 'author_name'  , name: '著者名' },
    { id: 'tag'          , name: 'タグ' },
    { id: 'url'          , name: 'URL' },
  ]

  enum_accessor :id
end