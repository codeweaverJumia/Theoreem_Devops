var AWS = require('aws-sdk');
AWS.config.update({region: 'us-east-1'});
const s3 = new AWS.S3({apiVersion: '2006-03-01'});
const bucketName = process.env.bucketName;
const keyName = process.env.keyName;

exports.handler = function(event, context, callback) {

    var bucketParams = {
        Bucket : bucketName,
        Key: keyName
    };

    s3.getObject(bucketParams, function(err, data) {
       if (err) {
          console.log("Error", err);
       } else {
        callback(null, data.Body.toString());
      }
    });

};