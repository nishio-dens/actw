class Division::CoordinationType < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'rss'          , name: 'RSS' },
    { id: 'github'       , name: 'Github' },
    { id: 'qiita'        , name: 'Qiita' }
  ]

  enum_accessor :id
end
