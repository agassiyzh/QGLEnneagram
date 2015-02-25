Link = require('react-router').Link
mui = require('material-ui')
Paper = mui.Paper
Toggle = mui.Toggle

data = [
  {questionContent: "我觉得许多人倚赖我的帮忙和慷慨。"}
  {questionContent: "我很努力纠正自己的缺失。"}
  {questionContent: "我是一个不断朝向目标生活的外向人。"}
  {questionContent: "我认為大多数人都不懂得欣赏生命的内在美。"}
  {questionContent: "我倾於收藏自己的感情，是个多接受少付出的人。"}
  {questionContent: "我是一个彻头彻尾、站在路中心的人，我最大的敌人是自己的恐惧。"}
]

QuestionItem = React.createClass
  render: ->
    <Paper className="questionNode">
      <Toggle label={this.props.questionContent} />
    </Paper>

QuestionList = React.createClass
    getInitialState: ->
      data: []

    componentDidMount: ->
      $.ajax(
        {
          url: @props.url
          dataType: 'json'
          success: ((data)->
            newData = data.map (question, index)->
              {questionContent: (index + 1).toString() + " . " + question}

            @setState {data: newData}
            return
          ).bind(this)
          error: ( (xhr, status, err)->
            console.error(@props.url, status, err.toString())
            ).bind(this)
        }
      )

    render: ->
      questionNodes = this.state.data.map (question) ->
        <QuestionItem questionContent={question.questionContent} />

      return (<div className="questionList" >
        {questionNodes}
      </div>)

QuestionForm = React.createClass
  render: ->
    <div className="questionForm">
      Hello, world! I am QuestionForm.
    </div>

module.exports = React.createClass
  displayName: 'HelloWorld'

  render: ->
      return (<div>
        <QuestionList url='questions.json' />
        <QuestionForm />
      </div>)
