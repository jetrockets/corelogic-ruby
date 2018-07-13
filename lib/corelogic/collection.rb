module Corelogic
  class Collection
    extend Forwardable
    def_delegators :@members, *[].public_methods

    DEFAULT_RECORDS_LIMIT = 10
    attr_reader :members, :klass, :raw_hash, :total_pages, :current_page, :limit_value, :total_records

    def initialize(klass, raw_hash)
      @klass = klass
      @raw_hash = raw_hash

      @total_pages = raw_hash[:totalPages] || 1
      @current_page = raw_hash[:pageNumber] || 1
      @limit_value = raw_hash[:pageSize] || DEFAULT_RECORDS_LIMIT
      @total_records = raw_hash[:totalRecords]

      if !raw_hash[:data].nil? && !raw_hash[:data].empty?
        @members = raw_hash[:data].map do |record|
          klass.new(record)
        end
      else
        @members = []
      end
    end

    def to_a
      @members
    end

  end
end