Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

injectTapEventPlugin = require("react-tap-event-plugin")
injectTapEventPlugin()

mui = require('material-ui')
RaisedButton = mui.RaisedButton
Paper = mui.Paper

module.exports = React.createClass
    displayName: 'HelloWorld'
    render: ->
        githubButton = (
            <mui.IconButton
                className="github-icon-button"
                iconClassName="mui-icon-github"
                linkButton={false} />
        )

        return (
            <mui.AppCanvas  predefinedLayout={1}>
                <mui.AppBar
                            title="九型人格测试"
                            onMenuIconButtonTouchTap={this._onMenuIconButtonTouchTap}
                            className='mui-dark-theme'
                            zDepth={0}>
                    {githubButton}
                </mui.AppBar>
                <div className="mui-app-content-canvas page-with-nav">

                    <div className="page-with-nav-content">
                        <div className='question-content'>
                            <Paper rounded={true} zDepth={2}>
                                <RouteHandler />
                            </Paper>
                        </div>
                    </div>
                </div>

            </mui.AppCanvas>
        )
