# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"

pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.1.2/app/assets/javascripts/actiontext.esm.js"
pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.8/dist/trix.esm.min.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "stimulus-datepicker", to: "https://ga.jspm.io/npm:stimulus-datepicker@1.0.5/src/datepicker.js"
