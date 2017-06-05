package excepciones

import org.uqbar.commons.model.UserException

@SuppressWarnings("all")
class VillanoInvalidoException extends UserException {
	new(String message) {
		super(message)
	}	
}