# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "profit", to: "profit.js"
pin "card", to: "card.js"
pin "category_pulldown", to: "category_pulldown.js"
pin "header_underline", to: "header_underline.js"
pin "scroll", to: "scroll.js"
pin "select_button", to: "select_button.js"
pin "comment", to: "comment.js"
pin "preview", to: "preview.js"
pin "transition", to: "transition.js"
