class Division::JobStatus < ActiveHash::Base
  include ActiveHash::Enum

  self.data = [
    { id: '0', name: '実行中', status: 'running' },
    { id: '1', name: '正常終了', status: 'success' },
    { id: '2', name: '異常終了', status: 'failure' },
  ]

  enum_accessor :status
end
