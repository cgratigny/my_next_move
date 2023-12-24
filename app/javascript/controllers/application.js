import { Application } from "@hotwired/stimulus"
import { Datepicker } from 'stimulus-datepicker'

const application = Application.start()
application.register('datepicker', Datepicker)

import { Alert, Autosave, ColorPreview, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
application.register('alert', Alert)
application.register('autosave', Autosave)
application.register('color-preview', ColorPreview)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('popover', Popover)
application.register('slideover', Slideover)
application.register('tabs', Tabs)
application.register('toggle', Toggle)

// Configure Stimulus development experience
application.debug = true
window.Stimulus   = application

export { application }
