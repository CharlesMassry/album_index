# Album Index

With Album Index you can search through your favorite songs

To get started:

`git clone 'https://github.com/CharlesMassry/album_index'`

`cd album_index`

`bundle install`

`rake db:create`

`rake db:schema:load`

To seed the database using the LastFM api, simply go [lastFm](https://www.last.fm/api) and register for an api key,
then add your api key to a top level `.env` file like `LAST_FM_API_KEY=your_api_key`

Then you can run rake db:seed
`rake db:seed`

To run the tests:

Make sure qmake is installed, [here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit) are instructions to install based on your OS and package manager



