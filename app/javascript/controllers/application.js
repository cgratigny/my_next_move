import { Application } from "@hotwired/stimulus"
import { Datepicker } from 'stimulus-datepicker'

const application = Application.start()
application.register('datepicker', Datepicker)

// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }
