require 'webmuffinbasquet'

class Webmuffin
  # This muffin type knows it comes from a web request and lives in PATH_INFO
  @locator = 0
  @rawContents = ''
  @history = []
  @formattedContents = ''

# ===== CLASS METHODS =======
  def newWith( stuff )
    @rawContents = stuff
  end

  def newAtWith( locator, stuff )
    @locator = locator
    @rawContents = stuff
  end

  def self.extractFromWebMuffinBasquetAt(webMuffinBasquet, location)
    request = webMuffinBasquet.gimmeAt(location)
    rawContents = extractMuffinFromRequest(request)
    outMuffin = WebMuffin.newWith('hi') # eventually, rawContents
  end
# ===== BASIC INSTANCE METHODS =====

  def formatJSON
    # @formattedContents = .... whatever puts it into JSON
  end
end