# frozen_string_literal: true

require 'factory_bot_generator/version'

module FactoryBotGenerator
  class Base
    QUOTE_AROUND_VALUE_TYPES = %i[string date datetime text].freeze
    EXCLUDE_COLUMNS = %w[created_at updated_at].freeze
    TEMPLATE_PATH = File.join(File.dirname(__FILE__), 'factory_bot_generator.erb')
    TEMPLATE = File.read(TEMPLATE_PATH)

    def self.render(record, options = {})
      new(record, options).render
    end

    def initialize(record, options)
      @record = record
      @options = options
    end

    attr_reader :record, :options

    def render
      ERB.new(TEMPLATE, trim_mode: '-').result(binding)
    end

    private

    def name
      options[:name] || record_class.name.underscore
    end

    def columns
      @columns ||= record_class.column_names - exclude_columns
    end

    def indent
      @indent ||= columns.max_by(&:size).size + 1
    end

    def record_class
      @record_class ||= record.class
    end

    def exclude_columns
      @exclude_columns ||= (EXCLUDE_COLUMNS + options[:exclude].to_a.map(&:to_s))
    end
  end
end
