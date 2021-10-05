require("@rails/activestorage").start()
require("turbolinks").start()

//
// CSS
import 'scss/site'

// JS
import('js/site')

// Images
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

