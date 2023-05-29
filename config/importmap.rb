# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "jquery.jvectormap.min", to: "js/jquery.jvectormap.min.js", preload: true
pin "jquery-jvectormap-world-mill-en", to: "js/jquery-jvectormap-world-mill-en.js", preload: true
pin "jquery", to: "jquery.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "jquery-ui", to: "jquery-ui.min.js", preload: true
pin "popper.js", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.js", preload: true
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "timeline", to: "js/timeline.js", preload: true

pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.1
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.4/dist/trix.esm.min.js"
pin "@rails/actiontext", to: "https://ga.jspm.io/npm:@rails/actiontext@7.0.4-3/app/assets/javascripts/actiontext.js"
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4-3/lib/assets/compiled/rails-ujs.js", preload: true
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.7/lib/index.js", preload: true
pin "bootstrap-tooltip", to: "https://ga.jspm.io/npm:bootstrap-tooltip@3.1.1/index.js"
pin "@hotwired/turbo-rails", to: "https://ga.jspm.io/npm:@hotwired/turbo-rails@7.3.0/app/javascript/turbo/index.js", preload: true
pin "@hotwired/turbo", to: "https://ga.jspm.io/npm:@hotwired/turbo@7.3.0/dist/turbo.es2017-esm.js"
pin "@rails/actioncable/src", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4/src/index.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.4.0/js/fontawesome.js"
pin "jquery-ui", to: "https://ga.jspm.io/npm:jquery-ui@1.13.2/ui/widget.js", preload: true
pin "jquery-ujs", to: "https://ga.jspm.io/npm:jquery-ujs@1.2.3/src/rails.js", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@knight-lab/timelinejs", to: "https://ga.jspm.io/npm:@knight-lab/timelinejs@3.9.2/index.js"
pin "dompurify", to: "https://ga.jspm.io/npm:dompurify@2.4.5/dist/purify.js"
pin "wicg-inert", to: "https://ga.jspm.io/npm:wicg-inert@3.1.2/dist/inert.esm.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.4-3/app/assets/javascripts/actioncable.esm.js"
pin "stimulus-sortable", to: "https://ga.jspm.io/npm:stimulus-sortable@4.1.0/dist/stimulus-sortable.mjs"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.8/src/index.js"
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.0/modular/sortable.esm.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin "tailwindcss-stimulus-components" # @3.0.4