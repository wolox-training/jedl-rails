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

    if !response.parsed_response.empty?
      response["ISBN:#{isbn}"].select do |k|
        @fields.include? k
      end
    else
      { error: 'Book not found' }
    end
  end
end
