# Jekyll-FTP

## Commands
* `jekyll-ftp deploy` - Deploy your site via FTP with the preconfigured settings.
* `jekyll-ftp clean` - Remove all the files from the preconfigured `remote_dir`.

## Installation

Add the gem to your `Gemfile`.

```ruby
# Gemfile

gem `jekyll-ftp`
```

Add the gem to your `plugins` in your `_config.yml`.

```yaml
# _config.yml

plugins:
  - jekyll-ftp
```

## Configuring your `_config.yml` File

Since [Jekyll](https://github.com/mojombo/jekyll) uses `_config.yml`, Jekyll-FTP uses this too.

Jekyll-FTP needs 3 configuration settings:
* `username` - Your FTP server username.
* `server_url` - The URL for your FTP server (can also be an FTP).
* `remote_dir` - The remote directory where your site is to be deployed.

```yaml
username: UserName
server_url: ftp.myserver.com
remote_dir: /public_html
```

[Here's an example configuration.](https://gist.github.com/JesseHerrick/6965950).
