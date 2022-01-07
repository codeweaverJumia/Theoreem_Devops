var AWS = require('aws-sdk');
AWS.config.update({region: 'us-east-1'});
const s3 = new AWS.S3({apiVersion: '2006-03-01'});
const bucketName = process.env.bucketName;
const keyName = process.env.keyName;

exports.handler = async (event, context) => {
    const params = {
        Bucket: bucketName,
        Key: keyName,
    }; 
    try {
        let item = await s3.getObject(params).promise();
        let itemjson =item.Body.toString();
          const response = {
                statusCode: 200,
                body: itemjson
                      }
        console.log(itemjson);
        return response;
    } catch (err) {
        console.log(err);
        const message = `Error getting object ${keyName} from bucket ${bucketName}. Make sure they exist and your bucket is in the same region as this function.`;
        console.log(message);
        throw new Error(message);
    }
};
