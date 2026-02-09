const { IgApiClient } = require('instagram-private-api');
const { readFile } = require('fs');
const { promisify } = require('util');
const readFileAsync = promisify(readFile);
const ig = new IgApiClient();
​
// Log in to your account
const auth = await ig.account.login('username', 'password');
​
// Post the image
const publishResult = await ig.publish.photo({
  file: await readFileAsync('path-to-image.jpg'),
  caption: 'Hello World',
});
