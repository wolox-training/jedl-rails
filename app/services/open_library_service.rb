##
# To see format, jscmd and fields options go to page
# https://openlibrary.org/dev/docs/api/books
##

class OpenLibraryService
  include HTTParty
  base_uri 'openlibrary.org/api/books'

  def initialize(format = 'json', jscmd = 'data', fields = %w[title subtitle authors pagination])
    @format = format
    @jscmd = jscmd
    @fields = fields
  end

  def book_info(isbn)
    response = self.class.get("?bibkeys=ISBN:#{isbn}&format=#{@format}&jscmd=#{@jscmd}")
    raise ActiveRecord::RecordNotFound, 'Book not found' if response.parsed_response.empty?

    data = response["ISBN:#{isbn}"].select do |k|
      @fields.include? k
    end
    data.merge(isbn: isbn)
  end
end
