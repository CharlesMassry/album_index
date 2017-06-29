# Album Index

With Album Index you can search through your favorite songs

Dependencies:

    - Postgres
    - Nodejs
    - Ruby on Rails

To get started:

`git clone 'https://github.com/CharlesMassry/album_index'`

`cd album_index`

`bundle install`

`rake db:create`

`rake db:schema:load`

To easily add songs to the database using the LastFM api, simply go to [lastFm](https://www.last.fm/api) and register for an api key,
then add your api key to a top level `.env` file like `LAST_FM_API_KEY=your_api_key`

Then you can run `rake scrapers:song_scraper`

You can also add songs using the song scraper rake task i.e. `rake scrapers:artist_scraper["Taylor Swift"]`

To start the app, first run `yarn install` to install the front end dependencies. It is recommended to install the foreman gem, `gem install foreman`, then run `foreman start` and visit the app at `localhost:3000`

To run the tests:

Make sure Google Chrome is installed for the javascript integration tests, and you can run `rake` to execute all of the tests
