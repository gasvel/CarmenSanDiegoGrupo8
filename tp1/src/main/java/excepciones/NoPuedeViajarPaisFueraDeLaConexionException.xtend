package excepciones

import org.uqbar.commons.model.UserException

@SuppressWarnings("all")
class NoPuedeViajarPaisFueraDeLaConexionException extends UserException {
	new(String message) {
		super(message)
	}	
}