exports.handler = (event, context, callback) => {
  let body = JSON.parse(event.body)
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      //message: 'Welcome to our demo API, here are the details of your request;'
      message: 'Welcome to our demo API, here are the details of your request; HEADERS:' + event.headers['content-type'] + 'Method:' + event.headers['httpMethod'] + ' {username:' + body.username + ', password:' + body.password + '} '

    })
  }
  callback(null, response)
}