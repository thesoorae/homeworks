require 'sqlite3'
require 'singleton'
require_relative "plays.rb"

class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('playwrights.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Playwright
  def self.all
    data = PlaywrightDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playright.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year)
    INSERT INTO
      playwrights
    VALUES
      (?, ?)
      SQL
      @id = PlaywrightDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
    UPDATE
      playwrights
    SET
      name = ?, birth_year = ?
    WHERE
      id = ?
    SQL
  end

  def get_plays
    PlayDBConnection.instance.execute(<<-SQL, @id)
    SELECT
    *
    WHERE
    playwright_id = ?

    SQL
  end

end
