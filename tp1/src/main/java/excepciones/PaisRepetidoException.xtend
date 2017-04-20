package excepciones

import org.uqbar.commons.model.UserException

@SuppressWarnings("all")
class PaisRepetidoException extends UserException {
	new(String message) {
		super(message)
	}	
}