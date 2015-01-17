class Division::RssField < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'title'        , name: 'タイトル' },
    { id: 'author'       , name: '著者名' },
    { id: 'categories'   , name: 'タグ' },
    { id: 'url'          , name: 'URL' },
  ]

  enum_accessor :id
end
