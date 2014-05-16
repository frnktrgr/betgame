package de.betgame

/**
 * MainTagLib
 * A taglib library provides a set of reusable tags to help rendering the views.
 */
class MainTagLib {
    static defaultEncodeAs = 'raw'
    //static encodeAsForTags = [tagName: 'raw']
	
	static namespace = "bg"
	
	def flag = { attrs, body ->
		def imgLink
		def imgBaseDir = '/images/flags/'
		def countryCode		
		
		if (attrs.country) {
			if (!attrs.country.net) {
				// fuckin england.
				countryCode = attrs.country.key
			} else {
				countryCode = attrs.country.net
			}
		}
		
		if (countryCode) {
			imgLink = g.resource(dir:imgBaseDir,file:"${countryCode}.png")
			out << "<img src='${imgLink}' alt='${attrs.country?.name}'/>"
		}
	}
	
	def localizedGameDate = { attrs, body ->
		if (attrs.game) {
			def locDate = attrs.game.getLocalPlayAt()
			if (locDate) {
				out << g.formatDate(date: locDate, type: attrs.type, timeStyle: attrs.timeStyle, dateStyle: attrs.dateStyle)
			} else if (!locDate && !attrs.forceLocalTimeZone) {
				out << g.formatDate(date: attrs.game.playAt, type: attrs.type, timeStyle: attrs.timeStyle, dateStyle: attrs.dateStyle)
				out << "(!)"
			}
		}
	}
}