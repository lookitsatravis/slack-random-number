# Slack Random Number Command

This app let's you add a slash command to Slack to generate a random number.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lookitsatravis/slack-random-number)

## Installation

After deployment, you'll need to set the env var `SLACK_SLASH_COMMAND_TOKEN` which matches your slash command token in Slack. Then simply point the slash command to your app's URL (ex: https://mighty-thicket-54656.herokuapp.com/random). I used `/random` as the command, and the logo from this repo as the icon.

## Usage

In Slack, just type `/random min max` where `min` is the lower value, and max is the upper value. For example: `/random 1 10000` will produce a number between 1 and 10000.

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

