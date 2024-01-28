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
pin "tailwindcss-stimulus-components", to: "https://ga.jspm.io/npm:tailwindcss-stimulus-components@4.0.4/dist/tailwindcss-stimulus-components.module.js"

pin "@primer/view-components", to: "https://ga.jspm.io/npm:@primer/view-components@0.16.1/app/components/primer/primer.js"
pin "@github/auto-check-element", to: "https://ga.jspm.io/npm:@github/auto-check-element@5.4.1/dist/index.js"
pin "@github/auto-complete-element", to: "https://ga.jspm.io/npm:@github/auto-complete-element@3.6.0/dist/index.js"
pin "@github/catalyst", to: "https://ga.jspm.io/npm:@github/catalyst@1.6.0/lib/index.js"
pin "@github/clipboard-copy-element", to: "https://ga.jspm.io/npm:@github/clipboard-copy-element@1.3.0/dist/index.js"
pin "@github/combobox-nav", to: "https://ga.jspm.io/npm:@github/combobox-nav@2.3.1/dist/index.js"
pin "@github/details-menu-element", to: "https://ga.jspm.io/npm:@github/details-menu-element@1.0.13/dist/index.js"
pin "@github/image-crop-element", to: "https://ga.jspm.io/npm:@github/image-crop-element@5.0.0/dist/index.js"
pin "@github/include-fragment-element", to: "https://ga.jspm.io/npm:@github/include-fragment-element@6.3.0/dist/index.js"
pin "@github/mini-throttle", to: "https://ga.jspm.io/npm:@github/mini-throttle@2.1.1/dist/index.js"
pin "@github/relative-time-element", to: "https://ga.jspm.io/npm:@github/relative-time-element@4.3.0/dist/index.js"
pin "@github/tab-container-element", to: "https://ga.jspm.io/npm:@github/tab-container-element@3.3.0/dist/index.js"
pin "@oddbird/popover-polyfill", to: "https://ga.jspm.io/npm:@oddbird/popover-polyfill@0.3.7/dist/popover.js"
pin "@primer/behaviors", to: "https://ga.jspm.io/npm:@primer/behaviors@1.5.1/dist/esm/index.js"
pin "@primer/behaviors/utils", to: "https://ga.jspm.io/npm:@primer/behaviors@1.5.1/dist/esm/utils/index.js"

pin "stimulus-sortable", to: "https://ga.jspm.io/npm:stimulus-sortable@4.1.1/dist/stimulus-sortable.mjs"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js"
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.2/modular/sortable.esm.js"
pin "stimulus-rails-autosave", to: "https://ga.jspm.io/npm:stimulus-rails-autosave@5.1.0/dist/stimulus-rails-autosave.mjs"
