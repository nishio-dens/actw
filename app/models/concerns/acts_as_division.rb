module ActsAsDivision
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    DIVISION_PREFIX = "CACHED_DIVISION_"
    @division_loaded = false
    @division_records = []
    @division_type = "division_type"

    def enum_accessor(type)
      @division_type = type
    end

    def const_missing(action, *args)
      cached_action = "#{DIVISION_PREFIX}#{action}"
      if @division_loaded
        if self.const_defined? cached_action
          self.const_get(cached_action)
        else
          super action
        end
      else
        self.setup_divisions
        if self.const_defined? cached_action
          self.const_get(cached_action)
        else
          self.const_get(action)
        end
      end
    end

    def get(id)
      self.setup_divisions unless @division_loaded
      @division_records.find { |r| r.id == id }
    end

    def setup_divisions
      @division_loaded = true
      @division_records = self.all
      @division_records.each do |record|
        self.const_set("#{DIVISION_PREFIX}#{record[@division_type.to_sym]}".upcase.to_sym, record)
      end
    end

    def reload_divisions
      @division_records.each do |record|
        self.class_eval do
          remove_const("#{DIVISION_PREFIX}#{record[@division_type.to_sym]}".upcase.to_sym)
        end
      end
      @division_loaded = false
      @division_records = []
    end
  end
end
