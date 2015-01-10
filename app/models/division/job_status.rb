class Division::JobStatus < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: 'running', name: '実行中' },
    { id: 'success', name: '正常終了' },
    { id: 'failure', name: '異常終了' }
  ]

  enum_accessor :id
end
