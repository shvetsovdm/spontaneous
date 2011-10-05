# encoding: UTF-8

require 'xapian-fu'

module Spontaneous::Search
  class Database
    def self.create(index, revision)
      db = self.new(index, revision)
      db.create
      db
    end

    def initialize(index, revision)
      @index, @revision, @database = index, revision, nil
    end

    def create
      FileUtils.mkdir_p(directory)
      @database = XapianFu::XapianDb.new(xapian_options.merge({
        :create => true,
        :overwrite => true
      }))
    end

    def xapian_options
      { :dir => directory,
        :language => @index.language,
        :fields => @index.fields,
        :spelling => true }
    end

    def database
      @database ||= open_database
    end

    def open_database
      XapianFu::XapianDb.new(xapian_options)
    end

    def add(page)
      if @index.include?(page)
        database << @index.indexable_content(page)
      end
    end

    def close
      database.flush
    end

    def search(query, options = {})
      xapian_results = database.search(query, options)
      corrected_query = xapian_results.corrected_query
      # don't know if this is the right way to deal with the corrected query suggestion
      # but I would prefer that any searches act more like google and return a set of
      # results for a spelling correction if none have been found with the current query
      if xapian_results and xapian_results.empty? and !corrected_query.blank?
        xapian_results = database.search(corrected_query, options)
      end
      Results.new(xapian_results, corrected_query)
    end

    alias_method :<<, :add

    def directory
      S::Site.revision_dir(@revision) / "indexes" / @index.name
    end
  end # Database
end
