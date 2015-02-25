# Load css first thing. It gets injected in the <head> in a <style> element by
# the Webpack style-loader.
require '../styles/main.sass'
require '../styles/main.less'

React = require 'react'
# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

Router = require('react-router')
Route = Router.Route

# Require route components.
Enneagram = require './enneagram'
App = require './app'

routes = (
  <Route handler={App}>
    <Route name="enneagram" handler={Enneagram} path="/" />
  </Route>
)
Router.run(routes, (Handler) ->
  React.render <Handler/>, document.getElementById 'app'
)
